import '../data_state.dart';


class MatchDataState<T, E> extends StatefulWidget {
  const MatchDataState({
    super.key,
    required this.state,
    required this.fetched,
    this.notLoaded,
    this.loading,
    this.noData,
    this.failed,
  });

  // final DataState<T, E> state;
  // final Widget Function(NotLoaded<T>)? notLoaded;
  // final Widget Function(Loading<T>)? loading;
  // final Widget Function(Fetched<T>) fetched;
  // final Widget Function(NoData<T>)? noData;
  // final Widget Function(Failed<E>)? failed;

  final DataState<T, E> state;
  final Widget Function(NotLoaded<T>)? notLoaded;
  final Widget Function(Loading<T>)? loading;
  final Widget Function(Fetched<T>) fetched;
  final Widget Function(NoData<T>)? noData;
  final Widget Function(Failed<E>)? failed;

  @override
  State<MatchDataState> createState() => _MatchDataStateState<T, E>();
}

class _MatchDataStateState<T, E> extends State<MatchDataState<T, E>> {
  @override
  Widget build(BuildContext context) {
    return widget.state.match(
      notLoaded: (p0) => widget.notLoaded?.call(p0) ?? const SizedBox(),
      loading: (p0) =>
          widget.loading?.call(p0) ??
          Center(
            child: Text(
              'Đang tải dữ liệu...',
            //   style: const JobbyTextTheme.fallback().smallTextRegular,
            ),
          ),
      noData: (p0) =>
          widget.noData?.call(p0) ??
          Center(
            child: Text(
              'Không có dữ liệu',
            //   style: const JobbyTextTheme.fallback().smallTextRegular,
            ),
          ),
      failed: (p0) =>
          widget.failed?.call(p0) ??
          Center(
            child: Text(
              'Có lỗi xảy ra',
            //   style: const JobbyTextTheme.fallback().smallTextRegular,
            ),
          ),
      // fetched: (p0) => widget.fetched(p0),
      fetched: (state) => widget.fetched(state),
    );
  }
}
