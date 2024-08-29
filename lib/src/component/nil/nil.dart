import 'package:flutter/widgets.dart';


///[nil]
// A simple widget to add in the widget tree when you want to show nothing, with minimal impact on performance.
//
// Why?
// Sometimes, according to a condition, we want to display nothing. Usually when we can't return null, we would return something like const SizedBox() for example.
//
// This is good, but it has some performance impacts since SizedBox creates a [RenderObject]. The RenderObject lives in the render tree and some computations are performed on it,
// even if it paints nothing on the screen.
//
// We can do better, we can have a widget which does not create a RenderObject, while being still valid. The Nil widget is the minimal implementation for this use case.
// It only creates an Element and does nothing while it's building.
// Because the optimal way to use it, is to call const Nil(), it also comes with a nil constant that you can use everywhere (which is a const Nil()).

/// A [Nil] instance, you can use in your layouts.
const nil = Nil();

/// A widget which is not in the layout and does nothing.
/// It is useful when you have to return a widget and can't return null.
class Nil extends Widget {
  /// Creates a [Nil] widget.
  const Nil({super.key});

  @override
  Element createElement() => _NilElement(this);
}

class _NilElement extends Element {
  _NilElement(Nil super.widget);

  @override
  void mount(Element? parent, dynamic newSlot) {
    assert(parent is! MultiChildRenderObjectElement, """
        You are using Nil under a MultiChildRenderObjectElement.
        This suggests a possibility that the Nil is not needed or is being used improperly.
        Make sure it can't be replaced with an inline conditional or
        omission of the target widget from a list.
        """);

    super.mount(parent, newSlot);
  }

  @override
  bool get debugDoingBuild => false;

  @override
  void performRebuild() {
    super.performRebuild();
  }
}