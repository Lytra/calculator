/// A mathematical expression. This could be an entire calculation, or just 
/// a single term.
class Expression {
  final String _debugResult;

  const Expression.debug(this._debugResult);

  /// Determines whether or not this Expression is in its simplest form.
  bool isInSimplestForm() => true;

  /// Evaluates this expression to its simplest form, ideally a singular
  /// number if the context allows. If this Expression is already in
  /// its simplest form, then this method should return this Expression
  /// unchanged.
  Expression reduceToSimplestForm() => this;

  /// Returns a String representation of this Expression. This is used
  /// when fully rendering the expression is not necessary.
  String toString() => _debugResult;
}