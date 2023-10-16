//::///////////////////////////////////////////////
//:: Take the placable mirror
//:: cac_km_takemiror
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Destroy the placable mirror and create a inventory mirror
    on the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Keith K2 Hayward
//:: Created On: June 2004
//:://////////////////////////////////////////////
void main()
{
    object oPC = GetFirstPC();
    object oSelf = OBJECT_SELF;
    string sBracket = GetLocalString(oSelf, "BRACKET_NAME");
    object oBracket = GetObjectByTag(sBracket);

    string Dest1 = GetLocalString(oBracket, "DESTINATION1");

    SetLocalString(oBracket, "CURRENTDEST", Dest1);

    SetLocalInt(oBracket, "USABLE", TRUE);
    SetLocalInt(oBracket, "MIRROR", FALSE);

    CreateItemOnObject("pzl_mobilemirror", oPC);
    DestroyObject(oSelf, 0.5);
}
