//::///////////////////////////////////////////////
//:: Name: q1d_heartbeat
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
        Check to see if there are no kobolds left in
        the area.  If there are not - do a check
        on the state of the cook quest...
*/
//:://////////////////////////////////////////////
//:: Created By:   Keith Warner
//:: Created On:   Feb 11/03
//:://////////////////////////////////////////////

#include "nw_i0_plot"

void main()
{
    if (GetLocalInt(OBJECT_SELF, "nCookQuestOver") != 1)
    {

        //Check to see if this was the last kobold
        object oShaman = GetObjectByTag("q1dk_shaman");
        object oKobold1 = GetObjectByTag("q1dk_footpad1");
        object oKobold2 = GetObjectByTag("q1dk_footpad2");
        object oKobold3 = GetObjectByTag("q1dk_footpad3");
        object oKobold4 = GetObjectByTag("q1dk_footpad4");
        object oCook = GetObjectByTag("q1dcook");
        int nCount = 0;

        if (GetIsObjectValid(oKobold1))
                nCount += 1;
        if (GetIsObjectValid(oKobold2))
                nCount += 1;
        if (GetIsObjectValid(oKobold3))
                nCount += 1;
        if (GetIsObjectValid(oKobold4))
                nCount += 1;
        if (GetIsObjectValid(oShaman))
                nCount += 1;
        if (nCount <= 1)
        {
            SetLocalInt(OBJECT_SELF, "nCookQuestOver",1);
            if (GetIsObjectValid(oCook) == TRUE)
            {

                if (GetLocalInt(GetModule(), "X1_REWARDQ1DXP") != 1)
                {
                    //if the cook hasn't been taken captive or killed
                    if (GetLocalInt(GetModule(), "Captive_Cook") != 1 && GetLocalInt(GetModule(), "Captive_Cook") != 2)
                    {
                        RewardXP("xplow", 100, GetFirstPC(), ALIGNMENT_GOOD, TRUE);
                        SetLocalInt(GetModule(), "Captive_Cook", 3);
                        SetLocalInt(GetModule(), "X1_REWARDQ1DXP", 1);
                        AddJournalQuestEntry("q1dcook", 30, GetFirstPC(), TRUE, TRUE);
                    }

                }


            }
                //variable for getting NPCs to unequip weapons
                SetLocalInt(GetModule(),"X1_Q1DUNEQUIP", 1);
                //xp bonus for killing all the kobolds
                if (GetLocalInt(GetModule(), "X1_REWARDQ1DXP") != 1)
                {
                    RewardXP("xplow", 50, GetFirstPC());
                    SetLocalInt(GetModule(), "X1_REWARDQ1DXP", 1);
                }
                //Change the tavern music and stop the ambient mob sounds
                MusicBackgroundStop(OBJECT_SELF);
                MusicBackgroundChangeDay(OBJECT_SELF, TRACK_TAVERN3);
                MusicBackgroundChangeNight(OBJECT_SELF, TRACK_TAVERN3);
                MusicBackgroundPlay(OBJECT_SELF);
                object oSound1 = GetObjectByTag("snd_q1dscream");
                object oSound2 = GetObjectByTag("snd_q1dyells");
                object oSound3 = GetObjectByTag("snd_q1dmob");
                SoundObjectStop(oSound1);
                SoundObjectStop(oSound2);
                SoundObjectStop(oSound3);
                DestroyObject(oSound1);
                DestroyObject(oSound2);
                DestroyObject(oSound3);


        }
        //else see if the kobolds have killed all of the commoners
        else
        {

            object oCook = GetObjectByTag("q1dcook");
            object oLodar = GetObjectByTag("q1dlodar");
            object oMob1 = GetObjectByTag("q1dmob1");
            object oMob2 = GetObjectByTag("q1dmob2");
            object oMob3 = GetObjectByTag("q1dmob3");
            object oMob4 = GetObjectByTag("q1dmob4");
            object oMob5 = GetObjectByTag("q1dmob5");
            object oMob6 = GetObjectByTag("q1dmob6");

            if (GetIsObjectValid(oCook) == FALSE && GetIsObjectValid(oLodar) == FALSE
                && GetIsObjectValid(oMob1) == FALSE && GetIsObjectValid(oMob2) == FALSE
                && GetIsObjectValid(oMob3) == FALSE && GetIsObjectValid(oMob4) == FALSE
                 && GetIsObjectValid(oMob5) == FALSE && GetIsObjectValid(oMob6) == FALSE)
            {

                SetLocalInt(GetModule(),"X1_Q1DUNEQUIP", 1);
                MusicBackgroundStop(OBJECT_SELF);
                MusicBackgroundChangeDay(OBJECT_SELF, TRACK_TAVERN3);
                MusicBackgroundChangeNight(OBJECT_SELF, TRACK_TAVERN3);
                MusicBackgroundPlay(OBJECT_SELF);
                object oSound1_1 = GetObjectByTag("snd_q1dscream");
                object oSound2_1 = GetObjectByTag("snd_q1dyells");
                object oSound3_3 = GetObjectByTag("snd_q1dmob");
                SoundObjectStop(oSound1_1);
                SoundObjectStop(oSound2_1);
                SoundObjectStop(oSound3_3);
                DestroyObject(oSound1_1);
                DestroyObject(oSound2_1);
                DestroyObject(oSound3_3);


                //if the shaman doesn't exist - all other kobolds will just leave.
                if (GetIsObjectValid(oShaman) == FALSE || (GetLocalInt(oShaman, "nRewardedPC") == 1 && IsInConversation(oShaman) == FALSE))
                {

                    SetLocalInt(OBJECT_SELF, "nCookQuestOver",1);
                    SetLocalInt(GetArea(OBJECT_SELF), "nKoboldsFleeing", 1);
                }
            }
        }
    }
}
