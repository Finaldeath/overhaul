//::///////////////////////////////////////////////
//:: Name act_q2d2pit_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Set up the contestants in the Pit fight

    Red Gladiators q2d2redglad1 and 2  and potentially the slave girl
    Blue Gladiators q2d2blueglad1 and 2

    Custom Tokens -
    - 544 Red Gladiator Owner
    - 545 Red Gladiator Name
    - 546 Blue Gladiator Owner
    - 547 Blue Gladiator Name

    Fight variables
    X2_Q2DPitFightReady - 0    Not set up
    X2_Q2DPitFightReady - 1    Set up - not fought yet
    X2_Q2DPitFightReady - 2    Fight Over, waiting to talk to again
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 7/03
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();

    int nRandom;

    //Store the Gladiator Fight variables for use in the cutscene

    //if the PC has set his slave girl in here for a fight
    if (GetLocalInt(GetModule(), "X2_Q2DSlaveFight") == 1)
    {//then the PC needs to be used as the custom token
        SetCustomToken(544, GetName(oPC));
        SetCustomToken(545, "Slave Girl");
        //SetLocalInt(GetModule(), "X2_Q2DSlaveFight", 2);
        SetLocalString(GetModule(), "X2_Q2DRedGlad", "q2d2_girlglad");
    }
    else
    {// other wise Generate both the Random Tokens for conversation
        SetCustomToken(544, RandomName());
        SetCustomToken(545, RandomName());
        SetLocalString(GetModule(), "X2_Q2DRedGlad", "q2d2redglad" + IntToString(Random(2) + 1));
    }
    SetCustomToken(546, RandomName());
    SetCustomToken(547, RandomName());
    SetLocalString(GetModule(), "X2_Q2DBlueGlad", "q2d2blueglad" + IntToString(Random(2) + 1));


    //Set the variables that mark the Pit fight as ready to go
    SetLocalInt(GetModule(), "X2_Q2DPitFightReady", 1);
}
