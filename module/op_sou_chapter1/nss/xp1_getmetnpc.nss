int StartingConditional()
{
    object oPC = GetPCSpeaker();
    string sPCName = GetName(oPC);

    return(GetLocalInt(OBJECT_SELF, sPCName)==1);


}
