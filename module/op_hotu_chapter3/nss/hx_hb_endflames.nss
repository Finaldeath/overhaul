// Cutscene flames will die after 3 rounds.
void main()
{
    int iTimes = GetLocalInt(OBJECT_SELF, "HX_TIMES");

    if(iTimes == 2)
    {
        DestroyObject(OBJECT_SELF);
    }
    else
    {
        SetLocalInt(OBJECT_SELF, "HX_TIMES", iTimes + 1);
    }
}
