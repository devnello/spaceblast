part of game;

class Flash extends NodeWithSize {
  Flash(Size size, this.duration) : super(size) {
    MotionTween fade = new MotionTween<double>((a) { _opacity = a; }, 1.0, 0.0, duration);
    MotionSequence seq = new MotionSequence(<Motion>[fade, new MotionRemoveNode(this)]);
    motions.run(seq);
  }

  double duration;
  double _opacity = 1.0;
  Paint _cachedPaint = new Paint();

  void paint(Canvas canvas) {
    // Update the color
    _cachedPaint.color = new Color.fromARGB((255.0 * _opacity).toInt(),
                                            255, 255, 255);
    // Fill the area
    applyTransformForPivot(canvas);
    canvas.drawRect(new Rect.fromLTRB(0.0, 0.0, size.width, size.height),
      _cachedPaint);
  }
}
