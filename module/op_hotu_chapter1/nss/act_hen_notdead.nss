//::///////////////////////////////////////////////
//:: Name: act_hen_notdead
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Get rid of the IJUSTDIED variable for the henchman
    after he/she is spoken to once...
*/
//:://////////////////////////////////////////////
//:: Created By: Keith warner
//:: Created On: Dec 03/02
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(OBJECT_SELF, "X2_L_IJUSTDIED", 0);
}
