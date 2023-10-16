//::///////////////////////////////////////////////
//:: m4GameOver
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script fires when the game is over:
     - will export characters
     - will play end game movie
     - will end game
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

#include "achievement_lib"

void main()
{
//    AssignCommand(GetClickingObject(), SpeakString("Game Over"));
    object oPC = GetFirstPC();
    PlotAchievement(oPC, 4);

    ExportAllCharacters();
    DelayCommand(1.2,EndGame("Ending"));
}
