//::///////////////////////////////////////////////
//:: bk_longtunneldow
//:: Copyright (c) 2003 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Fade to black and travel through
    short tunnel
*/
//:://////////////////////////////////////////////
//:: Created By:  Brent
//:: Created On:
//:://////////////////////////////////////////////
//#include "bk_c2_include"
void JumpAssociates(object oPC, object oLoc);
void main()
{
    // * this script used for both the lower and the upper door
    string sDest = "wp_q2westud_uppertunnel";
    if (GetTag(OBJECT_SELF) == "bk_CaveLower")
    {
        sDest = "wp_q2westud_lowertunnel";
    }
    object oClicker = GetClickingObject();



    object oLoc = GetObjectByTag(sDest);
    FadeToBlack(oClicker, FADE_SPEED_FAST);
    AssignCommand(oClicker, DelayCommand(1.0, JumpToObject(oLoc)));
    DelayCommand(1.5, JumpAssociates(oClicker, oLoc));
    DelayCommand(1.0, FadeFromBlack(oClicker, FADE_SPEED_FAST));
}

void JumpAssociates(object oPC, object oLoc)
{
        object oAnimal = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPC);
        object oDominated = GetAssociate(ASSOCIATE_TYPE_DOMINATED, oPC);
        object oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPC);
        object oSummoned = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oPC);
        if(oAnimal != OBJECT_INVALID)
            AssignCommand(oAnimal, ActionJumpToObject(oLoc));
        if(oDominated != OBJECT_INVALID)
            AssignCommand(oDominated, ActionJumpToObject(oLoc));
        if(oFamiliar != OBJECT_INVALID)
            AssignCommand(oFamiliar, ActionJumpToObject(oLoc));
        if(oSummoned != OBJECT_INVALID)
            AssignCommand(oSummoned, ActionJumpToObject(oLoc));


        int i = 1;
        object oHenchman = GetHenchman(oPC, i);
        while(oHenchman != OBJECT_INVALID)
        {
            AssignCommand(oHenchman, ClearAllActions(TRUE));
            AssignCommand(oHenchman, ActionJumpToObject(oLoc));
            i++;
            oHenchman = GetHenchman(oPC, i);
        }
}
