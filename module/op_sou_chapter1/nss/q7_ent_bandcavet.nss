//Destroy bandit 3 if he enters (he goes into the cave.
void main()
{
    object oBandit = GetEnteringObject();
    if (GetTag(oBandit) == "q7bandit3")
    {
        DestroyObject(oBandit);
        DestroyObject(OBJECT_SELF);
    }

}
