//::///////////////////////////////////////////////
//:: Witch's Wake 1: Endgame Credit Sequence
//:: WW1_Credits.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Save out the variables to database and run
     the credits sequence.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: May 25, 2004
//:://////////////////////////////////////////////
#include "ww1_inc_database"

void RollCredits()
{
    object oCreditPC = GetFirstPC();
    int iN = 1;
    string sCredit = GetLocalString(GetModule(), "s"+IntToString(iN));
    while (sCredit != "//END//")
    {
        oCreditPC = GetFirstPC();
        while (oCreditPC != OBJECT_INVALID)
        {
            FloatingTextStringOnCreature(sCredit, oCreditPC, FALSE);
            oCreditPC = GetNextPC();
        }
        iN++;
        sCredit = GetLocalString(GetModule(), "s"+IntToString(iN));
    }
}

void main()
{
    //Save out the database
    string sWarning = "Saving to database. Please stand by.";
    object oPC = GetPCSpeaker();
    FloatingTextStringOnCreature(sWarning, oPC, TRUE);
    DelayCommand(0.5, WW1_SaveDatabase());
    ExportAllCharacters();

    //Fade to black
    DelayCommand(1.0, FadeToBlack(oPC, FADE_SPEED_SLOWEST));

    //Remove Cutscene mode
    DelayCommand(2.0, SetCutsceneMode(oPC, FALSE));

    //Roll Credits
    DelayCommand(3.0, EndGame("dd_ww_credits"));

/*
    int iN = 0;
    object oM = GetModule();
    SetLocalString(oM, "s"+IntToString(iN++), "Congratulations!");
    SetLocalString(oM, "s"+IntToString(iN++), "You have just completed Rob Bartel's");
    SetLocalString(oM, "s"+IntToString(iN++), "''Witch's Wake: Remastered.''");
    SetLocalString(oM, "s"+IntToString(iN++), "Thank you for playing.");
    SetLocalString(oM, "s"+IntToString(iN++), "");

    SetLocalString(oM, "s"+IntToString(iN++), "<< CREDITS >>");
    SetLocalString(oM, "s"+IntToString(iN++), "");
    SetLocalString(oM, "s"+IntToString(iN++), "<< Designed, Written & Implemented by: >>");
    SetLocalString(oM, "s"+IntToString(iN++), "Rob Bartel");
    SetLocalString(oM, "s"+IntToString(iN++), "");
    SetLocalString(oM, "s"+IntToString(iN++), "<< BioWare Internal Quality Assurance: >>");
    SetLocalString(oM, "s"+IntToString(iN++), "Jonathan Epp");
    SetLocalString(oM, "s"+IntToString(iN++), "Iain Stevens-Guille");
    SetLocalString(oM, "s"+IntToString(iN++), "Bruce Venne");
    SetLocalString(oM, "s"+IntToString(iN++), "");
    SetLocalString(oM, "s"+IntToString(iN++), "<< BioWare Community Live Team: >>");
    SetLocalString(oM, "s"+IntToString(iN++), "Diarmid Clarke - External Producer");
    SetLocalString(oM, "s"+IntToString(iN++), "Craig Priddle - Marketing Director");
    SetLocalString(oM, "s"+IntToString(iN++), "Jay Watamaniak - Community Manager");
    SetLocalString(oM, "s"+IntToString(iN++), "Derek French - Associate Producer");
    SetLocalString(oM, "s"+IntToString(iN++), "Robin Mayne - Web Producer");
    SetLocalString(oM, "s"+IntToString(iN++), "Jeff Marvin - Web Developer");
    SetLocalString(oM, "s"+IntToString(iN++), "Johnn Four - Web Content Developer");
    SetLocalString(oM, "s"+IntToString(iN++), "Craig Welburn - Game Programmer");
    SetLocalString(oM, "s"+IntToString(iN++), "Owen Borsdtadt - Tools Programmer");
    SetLocalString(oM, "s"+IntToString(iN++), "Colin Walmsley - Web Artist");
    SetLocalString(oM, "s"+IntToString(iN++), "Duleepa Wijayawardhana - Systems Developer");
    SetLocalString(oM, "s"+IntToString(iN++), "Craig Miller - Systems Administrator");
    SetLocalString(oM, "s"+IntToString(iN++), "Dave McGruther - Systems Administrator");
    SetLocalString(oM, "s"+IntToString(iN++), "Tom Ohle - Public Relations");
    SetLocalString(oM, "s"+IntToString(iN++), "Jonathan Epp - Lead Quality Assurance");
    SetLocalString(oM, "s"+IntToString(iN++), "Bruce Venne - Quality Assurance");
    SetLocalString(oM, "s"+IntToString(iN++), "Keith Hayward - Technical Designer");
    SetLocalString(oM, "s"+IntToString(iN++), "Rob Bartel - Senior Designer");
    SetLocalString(oM, "s"+IntToString(iN++), "");
    SetLocalString(oM, "s"+IntToString(iN++), "Rob would like to extend his special thanks");
    SetLocalString(oM, "s"+IntToString(iN++), "to all of the Beta Testers for this module.");
    SetLocalString(oM, "s"+IntToString(iN++), "Your insights have been invaluable");
    SetLocalString(oM, "s"+IntToString(iN++), "and your passion an endless inspiration.");
    SetLocalString(oM, "s"+IntToString(iN++), "");
    SetLocalString(oM, "s"+IntToString(iN++), "------------------------------------");

    SetLocalString(oM, "s"+IntToString(iN++), "While this module is complete,");
    SetLocalString(oM, "s"+IntToString(iN++), "you may linger here if you wish.");
    SetLocalString(oM, "s"+IntToString(iN++), "Your adventure will continue with");
    SetLocalString(oM, "s"+IntToString(iN++), "''Witch's Wake II''");
    SetLocalString(oM, "s"+IntToString(iN++), "//END//");

    DelayCommand(2.0, RollCredits());
*/}
