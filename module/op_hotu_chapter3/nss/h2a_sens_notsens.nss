//::///////////////////////////////////////////////
//:: Sensei Dharvana, Learns She Is Not Sleeping Man's True Love (Action Script)
//:: H2a_Sens_NotSens.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Player informs the Sensei that she is not
     he Sleeping Man's one true love.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 9, 2003
//:://////////////////////////////////////////////

void main()
{
    //Sensei is convinced that she is not the Sleeping Man's one true love
    SetLocalInt(OBJECT_SELF, "bThinksSheIsNotSleepingMansTrueLove", TRUE);
}
