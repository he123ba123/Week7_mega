import 'package:fetch_api/feature/data/model/post_data.dart';
import 'package:fetch_api/feature/presentation/cubit/post_event.dart';
import 'package:fetch_api/feature/presentation/cubit/post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostCubit extends Bloc<PostEvent, PostState> {
  PostCubit() : super(PostInitial()) {
    on<FetchDataEvent>((event, emit) async {
      emit(PostLoading());
      try {
        var posts = await PostData().getPostData();
        emit(PostSuccess(posts: posts));
      } catch (e) {
        emit(PostError(errorMessage: e.toString()));
      }
    });
  }
}

//---------------------------------
// class PostCubit extends Bloc<PostEvent, PostState> {
//   PostCubit() : super(PostInitial());
//   Future fetchDataCubit() async {
//     emit(PostLoading());
//     try {
//       var posts = await PostData().getPostData();
//       emit(PostSuccess(posts: posts));
//     } catch (e) {
//       emit(PostError( errorMessage: e.toString()));
//     }
//   }
// }
