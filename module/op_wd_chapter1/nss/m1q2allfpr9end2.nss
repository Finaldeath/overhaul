void main()
{
    if(GetLocalInt(OBJECT_SELF,"NW_L_M1Q2BAnger") < 20)
    {
        AdjustReputation(GetPCSpeaker(),OBJECT_SELF,-100);
        ActionAttack(GetPCSpeaker());

    }
}
