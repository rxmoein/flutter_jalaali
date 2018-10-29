class Div {
  int quot;
  int rem;
  Div({this.quot, this.rem});
}

Div div(x, y) {
  return new Div(
    quot: x ~/ y,
    rem: x % y,
  );
}

int fdiv(int a, int b) {
  return (a - (a < 0 ? b - 1 : 0)) ~/ b;
}

Div pdiv(int y, int x) {
  Div rv = div(y, x);
  if (rv.rem < 0) {
    if (x > 0) {
      rv.quot -= 1;
      rv.rem += x;
    } else {
      rv.quot += 1;
      rv.rem -= x;
    }
  }
  return rv;
}
