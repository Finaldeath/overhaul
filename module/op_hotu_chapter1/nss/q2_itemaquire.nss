//::///////////////////////////////////////////////
//:: Module Item Aquired Script
//:: q2_itemaquire
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When a plot item is aquired, this script will
    perform the appropriate actions
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Septermber 24, 2002
//:://////////////////////////////////////////////
#include "inc_plot_locals"

void main()
{
    if (GetIsPC(GetItemPossessor(GetModuleItemAcquired())) == TRUE)
    {
        //if the item is the dagger from the drow assassin
        if (GetTag(GetModuleItemAcquired()) == "x2drowdagger")
        {
            AssignCommand(GetItemPossessor(GetObjectByTag("x2drowdagger")), ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW));
            //Destroy the Body and the corpse
            object oBody = GetObjectByTag("q2adrowassassin");
            DestroyObject(GetItemPossessedBy(oBody, "x2drowdagger"));
            object oCorpse = GetObjectByTag("x2_corpse1");
            AssignCommand(oBody, SetIsDestroyable(TRUE));
            DestroyObject(oBody, 5.0);
            DestroyObject(oCorpse, 5.0);

            //AddJournalQuestEntry("awakenings", 30, GetItemPossessor(GetObjectByTag("x2drowdagger")));
        }
        //If the item is the note on the Ogre High mage in area q2b03
        //else if (GetTag(GetModuleItemAcquired()) == "NotefromTheMatron")
        //{
        //    AddJournalQuestEntry("q2ascoutum", 30, GetItemPossessor(GetObjectByTag("NotefromTheMatron")));
        //    AddJournalQuestEntry("q2b03sealedpassage", 10, GetItemPossessor(GetModuleItemAcquired()));
        //    SetLocalInt(GetModule(),"q2undermountainquest",40);
        //}
        //If the item is the portal stone
        else if (GetTag(GetModuleItemAcquired()) == "x2_p_reaper")
        {
            //Do a check to make sure this is not a duplicate reaper stone acquired
            //from the diving pool
            //All we need to check is if the module is the one giving the player the
            //relic - if it is not - then they are trying to get it from the store,
            //so destroy it...(Except for the very first time it is given out - must
            //make sure that this script gives the relic from the module)
            /*
            if (GetModuleItemAcquiredFrom() != OBJECT_INVALID && GetTag(GetModuleItemAcquiredFrom()) != "q2a_pc_equip")
            {
                DestroyObject(GetItemPossessedBy(GetItemPossessor(GetModuleItemAcquired()), "x2_p_reaper"));
            }
            */
            //else//if you did acquire the item - you get the journal entry
                AddJournalQuestEntry("portalstone", 20, GetItemPossessor(GetModuleItemAcquired()), FALSE );
        }
        //if the item is the Wedding band and Thomas is dead - then add the FindThomas quest 30 node
        else if (GetTag(GetModuleItemAcquired()) == "q2a1ring")
        {
            if (GetLocalInt(GetModule(), "X2_TOMDEAD") == 1 && IsPCOnCynnsQuest(GetItemPossessor(GetModuleItemAcquired())) == FALSE)
            {   //Add journal entry that you have found a wedding band that is inscribed Thomas and Cynn
                AddJournalQuestEntry("FindThomas", 35, GetItemPossessor(GetModuleItemAcquired()));
            }
            else if (GetLocalInt(GetModule(), "X2_TOMDEAD") == 1 && IsPCOnCynnsQuest(GetItemPossessor(GetModuleItemAcquired())) == TRUE)
            {
                //Add journal entry that you have found a Cynn's husband dead and recovered his wedding band
                AddJournalQuestEntry("FindThomas", 30, GetItemPossessor(GetModuleItemAcquired()));
            }
        }

  }
}
