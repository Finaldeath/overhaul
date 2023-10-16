//::///////////////////////////////////////////////
//:: m4patch2door.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
When door is destroyed, Morag should act
as if she spoke the player to prevent an
'easy' exploit bug.
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////


void main()
{
 SetLocalInt(GetModule(), "NW_G_MORAGINITTRIG",10);
    ExecuteScript("m4q1d08_breakc", GetNearestObjectByTag("M4Q01D08MORA"));
}
