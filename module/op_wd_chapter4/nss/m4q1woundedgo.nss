// * soldiers disappear when entering this trigger
void main()
{
    if (GetTag(GetEnteringObject()) == "M4Q01BWOUN")
    {
        DestroyObject(GetEnteringObject());
    }
}
