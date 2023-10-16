//::///////////////////////////////////////////////
//:: Witch Wake 1: Save Game before launching Witch Wake 2
//:: WW1_SaveGame.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Save the game and export all player
     characters.
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

void main()
{
    //Send message
    object oPC = GetPCSpeaker();
    FloatingTextStringOnCreature("Saving database... Please wait.", oPC);

    //Export characters
    DelayCommand(1.5, ExportAllCharacters());

    //Transfer variables into database.
    DelayCommand(1.6, ExecuteScript("ww1_savedatabase", GetModule()));

    //Send message
    DelayCommand(2.0, FloatingTextStringOnCreature("Database complete! Thank you for waiting.", oPC));
}
