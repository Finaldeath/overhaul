//::///////////////////////////////////////////////
//:: Name: q2a_endcon_durn
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Durnan's end of conversation functions.
    If Module variable DurnanSpoke is 0 - and the
    PC hero is the PC Speaker in the conversation,
    then this is Durnans speech in the Yawning Portal.
    After the Speech -
    A few drow will appear at the top of the stairs,
    the camera will focus on their leader.
    Camera will return to Durnan.  Durnan will draw
    his sword and speak.
    Camera will switch to drow - The drow will speak.
    Camera will switch to Durnan - He will speak again.
    Spawn in attackers throughout the Inn.
    End Cut Scene mode.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Jan 8/03
//:://////////////////////////////////////////////

void main()
{


    int nCase = GetLocalInt(GetModule(), "DurnanSpoke");
    switch (nCase)
    {
        case 1: //End of initial speech in the yawning portal.
                //Start the attack cutscene.
                //SetLocalInt(GetModule(), "DurnanSpoke", 1);
                // Store the PC so that we can make a copy of them.
                // Cutscene number 5 continues here
                if (GetLocalInt(GetModule(), "nYPAttackDone") != 1)
                {
                    object oPC = GetPCSpeaker();
                    //Remove freeze effect from PC
                    object oArea = GetArea(oPC);
                    effect eEffect = GetFirstEffect(oPC);
                    while (GetIsEffectValid(eEffect) == TRUE)
                    {
                        if (GetEffectCreator(eEffect) == oArea)
                        {
                            RemoveEffect(oPC, eEffect);
                        }
                        eEffect = GetNextEffect(oPC);
                    }


                    //Set PC Immortal for first battle
                    SetImmortal(oPC, TRUE);
                    //Change the music
                    MusicBackgroundChangeDay(oArea, TRACK_EVILDUNGEON2);
                    MusicBackgroundChangeNight(oArea, TRACK_EVILDUNGEON2);

                    MusicBackgroundPlay(oArea);
                    AddJournalQuestEntry("undermountain",10,GetFirstPC(),TRUE,TRUE);
                    ExecuteScript("cut5_ypattack", oArea);


                }
                break;
        case 2:  //End of speech in the well room.
                 //Fade to black, teleport
                 //all players to the YP main floor beside Tamsil.
                 //she will initiate dialog - after dialog - Tamsil
                 //will leave - fade to black - switch to the well
                 //room - a beholder comes out of the well and blasts
                 //Durnan - he falls down.  The 4 adventurers attack
                 //and the beholder retreats.  The adventurers shout
                 //'Follow it! Quickly! and run to the well.  Fade to
                 //black and return PCs to the main room.

                //SetLocalInt(GetModule(), "X2_CutScene5a", 1);

                SetLocalInt(GetModule(), "DurnanSpoke", 3);
                AddJournalQuestEntry("undermountain",20,GetFirstPC(),TRUE,TRUE);//JumpPlayers(GetPCSpeaker());
                break;
        default:
                break;
    }
}


