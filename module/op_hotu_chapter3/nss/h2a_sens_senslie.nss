//::///////////////////////////////////////////////
//:: Sensei Dharvana, Lied To About Being Sleeping Man's True Love (Action Script)
//:: H2a_Sens_SensLie.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Player lies to the Sensei, telling her that
     she is the Sleeping Man's one true love.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 9, 2003
//:://////////////////////////////////////////////

void main()
{
    //Sensei is convinced that she is the Sleeping Man's one true love
    SetLocalInt(OBJECT_SELF, "bThinksSheIsSleepingMansTrueLove", TRUE);
}
