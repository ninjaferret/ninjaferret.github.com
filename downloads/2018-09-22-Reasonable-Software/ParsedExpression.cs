var expression = new Expression("x + y");
var expType = expression.Type;

public class Expression
{
    private Node node;
    private Tuple<string, string> baseValues;

    public Expression(string value)
    {
        Value = value;
    }

    public string Value
    {
        get {return Utils.ConvertTo(BaseValues.Item2, out node);}
        set
        {
            BaseValues = Utils.ConvertFrom(value, out node);
        }
    }

    public ExpressionType Type{get {return Node.Type;}}

    internal Node Node
    {
        get
        {
            if (node == null)
            {
                Value = BaseValues.Item2;
            }

            return node;
        }
    }

    private Tuple<string, string> BaseValues
    {
        get {return baseValues;}
        set
        {
            if (!Equals(value, baseValues))
            {
                baseValues = value;
                node = null;
            }
        }
    } 
}