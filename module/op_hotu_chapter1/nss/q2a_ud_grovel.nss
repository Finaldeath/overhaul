//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName q2a_ud_grovel
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Grovel will clean up the well room if hired
    by Durnan...
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: July 30/03
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {

        if (GetAILevel(OBJECT_SELF) != AI_LEVEL_VERY_LOW)
        {
            //if the Grovel has been hired by Durnan
            if (GetLocalInt(GetModule(),"Grovel") == 30)
            {
                //and no one is talking to Grovel
                if (IsInConversation(OBJECT_SELF) == FALSE && GetIsInCombat() == FALSE)
                {
                    SetLocalInt(OBJECT_SELF, "nHBCOUNT", GetLocalInt(OBJECT_SELF, "nHBCOUNT") + 1);

                    if (GetLocalInt(OBJECT_SELF, "nHBCOUNT") == 3)
                    {
                        if (GetLocalInt(OBJECT_SELF, "nGotJob") != 1)
                        {
                            SetLocalInt(OBJECT_SELF, "nGotJob", 1);

                            object oToClean = GetNearestObjectByTag("WeatheringScorchMark");
                            float fDistance;
                            if (GetIsObjectValid(oToClean) == TRUE && GetTag(GetArea(oToClean)) == GetTag(GetArea(OBJECT_SELF)))
                            {
                                fDistance = GetDistanceToObject(oToClean);
                                ActionMoveToObject(oToClean);
                                DelayCommand(fDistance/3 + 1.0, AssignCommand(OBJECT_SELF, ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW, 1.0, 2.0)));
                                DestroyObject(oToClean, fDistance/3 + 3.0);
                                switch (Random(3) + 1)
                                {
                                    case 1: DelayCommand(2.0, PlaySpeakSoundByStrRef(84031));
                                            break;
                                    case 2: DelayCommand(2.0, PlaySpeakSoundByStrRef(84032));
                                            break;
                                    case 3: DelayCommand(2.0, PlaySpeakSoundByStrRef(84033));
                                            break;

                                }
                            }
                            else
                            {
                                oToClean = GetNearestObjectByTag("Bloodstain");
                                ActionMoveToObject(oToClean);
                                DelayCommand(fDistance/3 + 1.0, AssignCommand(OBJECT_SELF, ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW, 1.0, 2.0)));
                                DestroyObject(oToClean, fDistance/3 + 3.0);
                                switch (Random(3) + 1)
                                {
                                    case 1: DelayCommand(2.0, PlaySpeakSoundByStrRef(84034));
                                            break;
                                    case 2: DelayCommand(2.0, PlaySpeakSoundByStrRef(84035));
                                            break;
                                    case 3: DelayCommand(2.0, PlaySpeakSoundByStrRef(84036));
                                            break;

                                    }
                                }
                            }
                        }
                        else if (GetLocalInt(OBJECT_SELF, "nHBCOUNT") == 7)
                        {

                            ActionPlayAnimation(ANIMATION_LOOPING_PAUSE_TIRED);
                            PlaySpeakSoundByStrRef(84037);

                        }
                        else if (GetLocalInt(OBJECT_SELF, "nHBCOUNT") == 10)
                        {
                            ActionMoveToObject(GetWaypointByTag("wp_q2agrovel_start"), FALSE);
                            DelayCommand(10.0, SetFacingPoint(GetPosition(GetObjectByTag("q2adurnan"))));
                            SetLocalInt(OBJECT_SELF, "nHBCOUNT", 0);
                            SetLocalInt(OBJECT_SELF, "nGotJob", 0);
                        }
                    }
                }
            }
        }

}

