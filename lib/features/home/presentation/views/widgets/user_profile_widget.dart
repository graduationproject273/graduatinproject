import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution/core/routeing/routes.dart';
import 'package:gradution/features/home/presentation/cubit/cubit/userprofile_cubit.dart';
import 'package:gradution/features/sellerDashboard/presentation/cubit/profile/profile_cubit.dart';

class UserProfileWidget extends StatefulWidget {
  const UserProfileWidget({super.key});

  @override
  State<UserProfileWidget> createState() => _UserProfileWidgetState();
}

class _UserProfileWidgetState extends State<UserProfileWidget> {
  @override
  void initState() {
    super.initState();

    final cubit = context.read<UserprofileCubit>();
    if (cubit.state is! GetuserProfile) {
      cubit.getUserProfile();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserprofileCubit, UserprofileState>(
      listener: (context, state) {
        if (state is UserProfileFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error')),
          );
        }
      },
      builder: (context, state) {
        if (state is UserProfileLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetuserProfile) {
          return Scaffold(
            backgroundColor: Colors.grey[50],
            appBar: AppBar(
              title: const Text(
                'Profile',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: const Color(0xFF00917C),
              elevation: 0,
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  // Header section with curved background
                  Container(
                    height: 120,
                    decoration: const BoxDecoration(
                      color: Color(0xFF00917C),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                  ),

                  // Profile content
                  Transform.translate(
                    offset: const Offset(0, -60),
                    child: Column(
                      children: [
                        // Avatar section
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: CircleAvatar(
                            radius: 60,
                            backgroundColor:
                                const Color(0xFF00917C).withOpacity(0.1),
                            child: const Icon(
                              Icons.person,
                              size: 60,
                              color: Color(0xFF00917C),
                            ),
                            // Uncomment below to use network image
                            // backgroundImage: NetworkImage('https://your-avatar-url.com'),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Profile info cards
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              // Name card
                              _buildInfoCard(
                                icon: Icons.person_outline,
                                title: 'First Name',
                                subtitle: state.profile
                                    .firstname, // Replace with actual first + last name
                              ),

                              const SizedBox(height: 15),
                              _buildInfoCard(
                                icon: Icons.person_outline,
                                title: 'Last Name',
                                subtitle: state.profile
                                    .lastname, // Replace with actual first + last name
                              ),

                              const SizedBox(height: 15),

                              // Email card
                              _buildInfoCard(
                                icon: Icons.email_outlined,
                                title: 'Email',
                                subtitle: state
                                    .profile.email, // Replace with actual email
                              ),

                              const SizedBox(height: 30),


                             

                              BlocListener<UserprofileCubit, UserprofileState>(
                                listener: (context, state) {
                                  if (state is RemoveSeller) {
                                    GoRouter.of(context).go(Routes.login);
                                  } else if (state is ProfileFailure) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Error')),
                                    );
                                  }
                                },
                                child: _buildOptionTile(
                                  icon: Icons.logout_outlined,
                                  title: 'Logout',
                                  onTap: () {
                                    showLogoutDialog(context);
                                  },
                                  isDestructive: true,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return Container();
      },
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF00917C).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF00917C),
              size: 24,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isDestructive = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        onTap: onTap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        tileColor: Colors.white,
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isDestructive
                ? Colors.red.withOpacity(0.1)
                : const Color(0xFF00917C).withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: isDestructive ? Colors.red : const Color(0xFF00917C),
            size: 20,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: isDestructive ? Colors.red : Colors.black87,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.grey[400],
        ),
      ),
    );
  }
}

void showLogoutDialog(BuildContext parentcontext) {
  showDialog(
    context: parentcontext,
    builder: (context) => AlertDialog(
      backgroundColor: Colors.white, // 👈 تغيير الخلفية هنا
      title: const Text(
        "Confirm Logout",
        style: TextStyle(color: Colors.black), // لون النص
      ),
      content: const Text(
        "Are you sure you want to logout?",
        style: TextStyle(color: Colors.black), // لون النص
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("Cancel",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        ),
        TextButton(
          onPressed: () {
            parentcontext.read<ProfileCubit>().clearSeller();
          },
          child: const Text("Logout",
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
        ),
      ],
    ),
  );
}
