import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution/core/styles/colors.dart';
import 'package:gradution/depency_injection.dart';
import 'package:gradution/features/feedback/domain/entities/feedback_entity.dart';
import 'package:gradution/features/feedback/presentation/cubit/feedback_cubit.dart';

class ProductFeedbackScreen extends StatefulWidget {
  final int productId;
  const ProductFeedbackScreen({super.key, required this.productId});

  @override
  _ProductFeedbackScreenState createState() => _ProductFeedbackScreenState();
}

class _ProductFeedbackScreenState extends State<ProductFeedbackScreen> {
  String filterRating = 'all';

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<FeedbackCubit>()..getFeedbacksByProductId(widget.productId),
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          title: Text(
            'Product Reviews',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          backgroundColor: maincolor,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: BlocBuilder<FeedbackCubit, FeedbackState>(
          builder: (context, state) {
            if (state is FeedbackLoading) {
              return _buildLoadingState();
            } else if (state is FeedbackError) {
              return _buildErrorState(state.message);
            } else if (state is FeedbackLoaded) {
              return _buildFeedbackContent(state.feedbacks);
            } else {
              return _buildEmptyState();
            }
          },
        ),
      ),
    );
  }

  Widget _buildLoadingState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.indigo[600]!),
                  strokeWidth: 3,
                ),
                SizedBox(height: 16),
                Text(
                  'Loading reviews...',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(String message) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Container(
          padding: EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.red[50],
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Icon(
                  Icons.error_outline_rounded,
                  size: 48,
                  color: Colors.red[400],
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Oops! Something went wrong',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(height: 8),
              Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                  height: 1.4,
                ),
              ),
              SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () {
                  context.read<FeedbackCubit>().getFeedbacksByProductId(widget.productId);
                },
                icon: Icon(Icons.refresh_rounded, size: 20),
                label: Text('Try Again'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: maincolor,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Container(
          padding: EdgeInsets.all(40),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.indigo[50],
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Icon(
                  Icons.rate_review_outlined,
                  size: 48,
                  color: maincolor,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'No Reviews Yet',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Be the first to share your experience\nwith this product!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 16,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeedbackContent(List<FeedbackEntity> feedbacks) {
    if (feedbacks.isEmpty) {
      return _buildEmptyState();
    }

    // Calculate average rating
    double averageRating = feedbacks.map((f) => f.rating).reduce((a, b) => a + b) / feedbacks.length;
    
    return Column(
      children: [
        // Rating summary
        _buildRatingSummary(feedbacks, averageRating),
        
        // Reviews list
        Expanded(
          child: _buildFeedbackList(feedbacks),
        ),
      ],
    );
  }

  Widget _buildRatingSummary(List<FeedbackEntity> feedbacks, double averageRating) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [maincolor, maincolor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Text(
                  averageRating.toStringAsFixed(1),
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                _buildStarRating(averageRating.round(), color: Colors.white),
              ],
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Overall Rating',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Based on ${feedbacks.length} ${feedbacks.length == 1 ? 'review' : 'reviews'}',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 12),
                _buildRatingBreakdown(feedbacks),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingBreakdown(List<FeedbackEntity> feedbacks) {
    Map<int, int> ratingCounts = {};
    for (int i = 1; i <= 5; i++) {
      ratingCounts[i] = feedbacks.where((f) => f.rating == i).length;
    }

    return Column(
      children: [
        for (int i = 5; i >= 1; i--)
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2),
            child: Row(
              children: [
                Text('$i', style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                SizedBox(width: 4),
                Icon(Icons.star, size: 12, color: Colors.amber),
                SizedBox(width: 8),
                Expanded(
                  child: LinearProgressIndicator(
                    value: feedbacks.isNotEmpty ? (ratingCounts[i]! / feedbacks.length) : 0,
                    backgroundColor: Colors.grey[200],
                    valueColor: AlwaysStoppedAnimation<Color>(maincolor),
                    minHeight: 4,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  '${ratingCounts[i]}',
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildFeedbackList(List<FeedbackEntity> feedbacks) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16),
      itemCount: feedbacks.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 16),
          child: _buildFeedbackCard(feedbacks[index]),
        );
      },
    );
  }

  Widget _buildFeedbackCard(FeedbackEntity feedback) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User info and rating
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [maincolor, maincolor],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.person, color: Colors.white, size: 20),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _maskEmail(feedback.user.email),
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.grey[800],
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      _formatDate(feedback.createdAt),
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.amber[50],
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.amber[200]!),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    SizedBox(width: 4),
                    Text(
                      '${feedback.rating}',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[800],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 16),

          // Comment
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey[200]!),
            ),
            child: Text(
              feedback.comment != null && feedback.comment!.isNotEmpty
                  ? feedback.comment!
                  : 'No comment provided',
              style: TextStyle(
                color: feedback.comment != null && feedback.comment!.isNotEmpty
                    ? Colors.grey[700]
                    : Colors.grey[500],
                fontSize: 15,
                height: 1.5,
                fontStyle: feedback.comment != null && feedback.comment!.isNotEmpty
                    ? FontStyle.normal
                    : FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStarRating(int rating, {double size = 16, Color? color}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < rating ? Icons.star_rounded : Icons.star_outline_rounded,
          color: color ?? Colors.amber,
          size: size,
        );
      }),
    );
  }

  String _maskEmail(String email) {
    if (email.contains('@')) {
      List<String> parts = email.split('@');
      String username = parts[0];
      String domain = parts[1];
      
      if (username.length <= 2) {
        return email;
      }
      
      String maskedUsername = username.substring(0, 2) + '*' * (username.length - 2);
      return '$maskedUsername@$domain';
    }
    return email;
  }

  String _formatDate(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);
    
    if (difference.inDays == 0) {
      return 'Today';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays < 30) {
      return '${(difference.inDays / 7).floor()} weeks ago';
    } else {
      return dateTime.toLocal().toString().split(' ')[0];
    }
  }
}