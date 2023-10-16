// * soldiers disappear when entering this trigger
void main()
{
    if (GetTag(GetEnteringObject()) == "M4Q1ASoldier")
    {
        DestroyObject(GetEnteringObject());
    }
}
