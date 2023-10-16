void main()
{
    if (Random(2) == 0 && GetLocalInt(GetArea(OBJECT_SELF),"NW_A_TrollsAttacked") == 0)
    {
        ClearAllActions();
        ActionAttack(GetObjectByTag("M2Q2BATORTURE"));
    }
    else
    {
        SpeakOneLinerConversation();
    }
}
