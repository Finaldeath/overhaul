// flag gargoyle statues as enemies

void main()
{
    object oPC = GetPCSpeaker();
    object oStatue = GetNearestObjectByTag("NW_GARGOYLE");
    if(oStatue != OBJECT_INVALID)
    {
        AdjustReputation(oPC, oStatue, -100);
        AdjustReputation(oStatue, oPC, -100);
    }
}
