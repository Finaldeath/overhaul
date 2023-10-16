//::///////////////////////////////////////////////
//:: Name chap1_onaquire
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    On Aquired Item script - Chapter 1
    CURRENTLY ALL ITEMS BEING CHECKED FOR MUST
    BE PLOT ITEMS OR THIS SCRIPT WILL NOT FIRE
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 12/03
//:://////////////////////////////////////////////

#include "q2_inc_plot"
#include "nw_i0_plot"

void DoStick(object oItem);

void main()
{
    object oItem = GetModuleItemAcquired();
    //Check to see if the item is a plot item
    if (GetPlotFlag(oItem) == TRUE)
    {
        object oPC = GetModuleItemAcquiredBy();

        //HENCHMEN SPECIAL ITEMS
        //else if the item is Dorna's battle axe
        if (GetTag(oItem) == "x0_dor_battleaxe")
        {
            //Do a Henchman check
            if (GetTag(oPC) != "x0_hen_dor")
            {
                DestroyObject(oItem);
                object oDorna = GetObjectByTag("x0_hen_dor");
                if (GetIsObjectValid(oDorna) == TRUE)
                    CreateItemOnObject("dor_battleaxe", oDorna);
            }

        }
        //else if the item is Xanos's bracer
        else if (GetTag(oItem) == "x0_xan_bracer")
        {
            //Do a Henchman check
            if (GetTag(oPC) != "x0_hen_xan")
            {
                DestroyObject(oItem);
                object oXanos = GetObjectByTag("x0_hen_xan");
                if (GetIsObjectValid(oXanos) == TRUE)
                    CreateItemOnObject("xan_bracer", oXanos);
            }

        }
        object oMaster;
        //if the henchman acquired a plot item - give it to its master..
        if (GetMaster(oPC) != OBJECT_INVALID)
        {
            oMaster = GetMaster(oPC);
            //CopyObject(oItem, GetLocation(OBJECT_SELF), oMaster);
            //DestroyObject(oItem);
        }
        //if it was the PC that acquired the item
        if (GetIsPC(oPC) == TRUE || oMaster != OBJECT_INVALID)
        {
            string szItemTag = GetTag(oItem);
            //If the Item is the Hawthorn berries for Drogan's cure
            if (szItemTag == "q1cureing3")
            {
                //Do a Henchman check
                if (oMaster != OBJECT_INVALID)
                    oPC = oMaster;
                if (GetLocalInt(oPC, "NW_JOURNAL_ENTRYq1cure") > 0)
                {
                    if (GetLocalInt(GetModule(), "X1_Q1CURE1") == 1)
                    {
                        SetLocalInt(GetModule(), "X1_Q1CURE1", 2);
                        AddJournalQuestEntry("q1cure", 40, oPC);
                    }
                    else
                    {
                        SetLocalInt(GetModule(), "X1_Q1CURE1", 1);
                        AddJournalQuestEntry("q1cure", 20, oPC);
                    }
                }
                else
                {
                    SetLocalInt(GetModule(), "X1_Q1CURE1", 1);
                }
            }
            //if the item was the Mummified Hand artifact
            else if(szItemTag == "mummifiedhand")
            {
                if (GetLocalInt(GetModule(), "XP1_RECOVERHAND") != 1)
                {
                    SetLocalInt(GetModule(), "XP1_RECOVERHAND", 1);
                    //Do a Henchman check
                    if (oMaster != OBJECT_INVALID)
                        oPC = oMaster;

                    SetLocalInt(GetModule(),"XP1_URKODEAD",1);

                    AddJournalQuestEntry("Q2_JOURNAL_KOBOLDS", 100, oPC);
                    SetLocalInt(GetModule(), "PLOTQ2_JOURNAL_KOBOLDS", 100);
                    RewardXP("xphigh", 100, oPC);
                }

            }
            //if the item was the The Tower Statue artifact
            else if(szItemTag == "x1tower")
            {
                if (GetLocalInt(GetModule(), "X1_RECOVERTOWER") != 1)
                {
                    //Do a Henchman check
                    if (oMaster != OBJECT_INVALID)
                        oPC = oMaster;

                    SetLocalInt(GetModule(),"X1_RECOVERTOWER",1);

                    RewardXP("xphigh", 100, oPC);
                }

            }
            //if the item was the The Mask artifact
            /* If the PC aquires the Mask before the Dragon Tooth -
            so kills Tymofarrar before J'Nah - then Deekin will
            disappear from Blumberg. After that point, he reappears
            in the High Forest after you exit J'Nah's dungeon
            (after killing her and getting the tooth)*/
            else if(szItemTag == "x1mask")
            {
                if (GetLocalInt(GetModule(), "X1_RECOVERMASK") != 1)
                {
                        //Do a Henchman check
                    if (oMaster != OBJECT_INVALID)
                        oPC = oMaster;
                    SetLocalInt(GetModule(),"X1_RECOVERMASK",1);
                    if (GetLocalInt(GetModule(), "X1_RECOVERTOOTH") != 1)
                    {
                        object oDeekin = GetObjectByTag("q6deekin");
                        DestroyObject(oDeekin);
                        SetLocalInt(GetModule(), "X1_DeekinSpawn", 2);
                    }
                    RewardXP("xphigh", 100, oPC);
                }
            }
            //if the item was the The Dragon's Tooth artifact
            else if(szItemTag == "x1dragontooth")
            {
                if (GetLocalInt(GetModule(), "X1_RECOVERTOOTH") != 1)
                {
                    //Do a Henchman check
                    if (oMaster != OBJECT_INVALID)
                        oPC = oMaster;

                    SetLocalInt(GetModule(),"X1_RECOVERTOOTH",1);
                    RewardXP("xphigh", 100, oPC);
                }

            }
            //else if the item is the Blake's baby for the stolen baby plot
            else if (szItemTag == "q1hbaby")
            {
                //Do a Henchman check
                if (oMaster != OBJECT_INVALID)
                    oPC = oMaster;
                SetLocalInt(GetModule(), "X1_Q1HPCHASBABY", 1);
                SetLocalInt(GetModule(), "X1_BLAKEHASBABY", 0);
                AddJournalQuestEntry("q1bfamily", 20, oPC);
            }


            else if (szItemTag == "q1bcards")
            {
                //Do a Henchman check
                if (oMaster != OBJECT_INVALID)
                    oPC = oMaster;
                if (GetLocalInt(oPC, "NW_JOURNAL_ENTRYq1bhalfling") == 15)
                {
                    //Add journal entry
                    AddJournalQuestEntry("q1bhalfling", 17, oPC);
                }
                else if ((GetLocalInt(oPC, "NW_JOURNAL_ENTRYq1bhalfling") == 10) ||
                        (GetLocalInt(oPC, "NW_JOURNAL_ENTRYq1bhalfling") == 16))
                {
                    AddJournalQuestEntry("q1bhalfling", 18, oPC);
                }
            }
        }
   }

}
void DoStick(object oItem)
{
    DestroyObject(oItem);
    CreateObject(OBJECT_TYPE_ITEM, "walkingstick", GetLocation(GetWaypointByTag("wp_q1a1_staff")));


}
