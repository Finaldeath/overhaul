// Beblith tunnels area user defined events:
// 101: Restore magic
// 102: Handle pressing of a rune plate

#include "x2_inc_itemprop"
#include "nw_i0_plot"
#include "x2c2_inc_plot"

void DebugString(string sStr)
{
    //PrintString(sStr);
}

void RestoreAllProperties(object oItem, object oPC, int nSlot = -1)
{
    DebugString("BOOM DEADM: TRYING to restore magic to item: <" + GetName(oItem) + "> tag= <" + GetTag(oItem) + ">");
    if(oPC != OBJECT_INVALID) // this is a pc object that has an item in inventory slot or normal inventory
    {
        if(oItem == OBJECT_INVALID)
            oItem = GetItemInSlot(nSlot, oPC);
        if(oItem == OBJECT_INVALID)
            return;
    }
    //object oChest = GetLocalObject(oItem, "ITEM_CHEST");
    // getting the key value - this points to the tag of the copy item
    string sKey = GetLocalString(oItem, "ITEM_KEY");
    // retrieving the copy item that is in this area
    object oOriginalItem = GetObjectByTag("q5c_item" + sKey);
    DebugString("BOOM DEADM: RESTORING magic for item: <" + GetName(oItem) +
        "> with key value= <" + sKey + "> for creature= <" + GetName(oPC) + ">");

    //object oOriginalItem = GetLocalObject(oChest, sKey);

    object oNewItem;
    if(oOriginalItem != OBJECT_INVALID) // item has not been restored yet
    {
        // replace current item with original
        IPCopyItemProperties(oOriginalItem, oItem);
        DestroyObject(oOriginalItem); // destroy dup item on player
        //DeleteLocalObject(oChest, GetResRef(oItem)); // so it won't be restored again
        DeleteLocalString(oItem, "ITEM_KEY");
    }
}

void RemoveEffects2(object oObject)
{
    // removing also polymorph so player would have his equipped items
    effect eEff = GetFirstEffect(oObject);
    while(GetIsEffectValid(eEff))
    {
        if(GetEffectType(eEff) == EFFECT_TYPE_SPELL_FAILURE || GetEffectType(eEff) == EFFECT_TYPE_POLYMORPH)
            RemoveEffect(oObject, eEff);
        eEff = GetNextEffect(oObject);
    }
}

void main()
{
    int nEvent = GetUserDefinedEventNumber();
    if(nEvent == 101) // restore magic
    {
        Reward_2daXP(GetFirstPC(), 51);
        SetPlot("q5_journal_beholders", 100);
        SetLocalInt(OBJECT_SELF, "DEAD_MAGIC_DISABLED", 1);
        //object oRunes = GetObjectByTag("q5c_runes");
        //DestroyObject(oRunes);
        object oSound = GetObjectByTag("q5c_obelisk_sound");
        SoundObjectStop(oSound);
        object oObelisk1 = GetObjectByTag("q5c_obelisk");
        location lLoc = GetLocation(oObelisk1);
        SetPlotFlag(oObelisk1, FALSE);
        DestroyObject(oObelisk1);
        object oObelisk = CreateObject(OBJECT_TYPE_PLACEABLE, "q5c_obelisk2", GetLocation(oObelisk1));
        effect eLight = EffectVisualEffect(VFX_DUR_ANTI_LIGHT_10);
        //effect eDeath = EffectDeath();
        effect eEff = GetFirstEffect(oObelisk);
        while(GetIsEffectValid(eEff))
        {
            RemoveEffect(oObelisk, eEff);
            eEff = GetNextEffect(oObelisk);
        }
        effect eVis = EffectVisualEffect(VFX_IMP_DISPEL);
        vector vPos = GetPosition(oObelisk);
        int i;
        float fDelay;
        for(i = 1; i <= 30; i++)
        {
            lLoc = Location(GetArea(OBJECT_SELF), vPos, 0.0);
            DelayCommand(fDelay, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, lLoc));
            fDelay += 0.05;
            vPos.z += 0.2;
        }
        eVis = EffectVisualEffect(VFX_DUR_PROT_SHADOW_ARMOR);
        DelayCommand(4.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, oObelisk));
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLight, oObelisk, 4.0);
        //DelayCommand(3.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDeath, oObelisk));
        eVis = EffectVisualEffect(VFX_IMP_BREACH);
        // Restoring magic for all creatures
        object oObject = GetFirstObjectInArea(OBJECT_SELF);
        while(oObject != OBJECT_INVALID)
        {
            if(GetObjectType(oObject) == OBJECT_TYPE_CREATURE)
            {
                DebugString("BOOM DEADM: *** Handling RESTORE of magic from creature: <" + GetName(oObject));
                RemoveEffects2(oObject);
                // Handle all items in inventory:
                object oItem = GetFirstItemInInventory(oObject);
                while(oItem != OBJECT_INVALID)
                {
                    DelayCommand(4.0, RestoreAllProperties(oItem, oObject, -1));
                    oItem = GetNextItemInInventory(oObject);
                }
                DelayCommand(4.0, RestoreAllProperties(OBJECT_INVALID, oObject, INVENTORY_SLOT_ARMS));
                DelayCommand(4.0, RestoreAllProperties(OBJECT_INVALID, oObject, INVENTORY_SLOT_ARROWS));
                DelayCommand(4.0, RestoreAllProperties(OBJECT_INVALID, oObject, INVENTORY_SLOT_BELT));
                DelayCommand(4.0, RestoreAllProperties(OBJECT_INVALID, oObject, INVENTORY_SLOT_BOLTS));
                DelayCommand(4.0, RestoreAllProperties(OBJECT_INVALID, oObject, INVENTORY_SLOT_BOOTS));
                DelayCommand(4.0, RestoreAllProperties(OBJECT_INVALID, oObject, INVENTORY_SLOT_BULLETS));
                DelayCommand(4.0, RestoreAllProperties(OBJECT_INVALID, oObject, INVENTORY_SLOT_CHEST));
                DelayCommand(4.0, RestoreAllProperties(OBJECT_INVALID, oObject, INVENTORY_SLOT_CLOAK));
                DelayCommand(4.0, RestoreAllProperties(OBJECT_INVALID, oObject, INVENTORY_SLOT_HEAD));
                DelayCommand(4.0, RestoreAllProperties(OBJECT_INVALID, oObject, INVENTORY_SLOT_LEFTHAND));
                DelayCommand(4.0, RestoreAllProperties(OBJECT_INVALID, oObject, INVENTORY_SLOT_LEFTRING));
                DelayCommand(4.0, RestoreAllProperties(OBJECT_INVALID, oObject, INVENTORY_SLOT_NECK));
                DelayCommand(4.0, RestoreAllProperties(OBJECT_INVALID, oObject, INVENTORY_SLOT_RIGHTHAND));
                DelayCommand(4.0, RestoreAllProperties(OBJECT_INVALID, oObject, INVENTORY_SLOT_RIGHTRING));

                DelayCommand(4.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oObject));
            }
            if(GetObjectType(oObject) == OBJECT_TYPE_ITEM)
            {
                DebugString("BOOM DEADM: *** Handling RESTORE of magic from DROPPED ITEM: <" + GetName(oObject));
                DelayCommand(10.0, RestoreAllProperties(oObject, OBJECT_INVALID));
            }
            oObject = GetNextObjectInArea(OBJECT_SELF);
        }


    }
    else if(nEvent == 102) // pressing a rune plate
    // Whenever using the plate - switch to the next rune. When all plates in the line
    // are the same, this line is locked. When all 4 lines are locked - the obelisk is disabled.
    {
        object oRune = GetLocalObject(OBJECT_SELF, "CURRENT_RUNE");
        object oPC = GetLocalObject(OBJECT_SELF, "PC");
        // if the rune is locked - do nothing (all other runes in the same line should also be locked)
        int nLocked = GetLocalInt(oRune, "LOCKED");
        if(nLocked == 1)
            return;

        // Switch the rune appearance
        string sTag = GetTag(oRune);
        int nNum = GetReflexSavingThrow(oRune); // the rune type is the reflex saving throw
        nNum++;
        if(nNum == 5)
            nNum = 1; // rune numbers are 1 to 4
        string sBP = "q5c_Rune" + IntToString(nNum); // getting the blue print
        // destroy the current rune and create the new one:
        location lLoc = GetLocation(oRune);
        object oMasterRune = GetNearestObjectByTag("q5c_MasterRune", oRune);
        int nType = GetReflexSavingThrow(oMasterRune);
        // storing the other runes' types before destroying the current one:
        object oRune1 = GetNearestObjectByTag("q5c_Rune" + IntToString(nType), oRune, 1);
        object oRune2 = GetNearestObjectByTag("q5c_Rune" + IntToString(nType), oRune, 2);
        int nRuneType1 = GetReflexSavingThrow(oRune1);
        int nRuneType2 = GetReflexSavingThrow(oRune2);
        SetPlotFlag(oRune, FALSE);
        DestroyObject(oRune);
        // creating a new rune with the same level (part of tag)
        object oNewRune = CreateObject(OBJECT_TYPE_PLACEABLE, sBP, lLoc, FALSE, "q5c_Rune" + IntToString(nType));
        AssignCommand(oPC, PlaySound("as_dr_stonmedcl1"));
        // now checking all 3 runes in the lines and comparing to the master rune's type
        if(nType == nRuneType1 &&
           nType == nRuneType2 &&
           nType == nNum) // got a match in the line
           {
                effect eVis = EffectVisualEffect(VFX_IMP_LIGHTNING_S);
                DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oMasterRune)));
                DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oRune1)));
                DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oRune2)));
                DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oNewRune)));
                SetLocalInt(oMasterRune, "LOCKED", 1);
                SetLocalInt(oRune1, "LOCKED", 1);
                SetLocalInt(oRune2, "LOCKED", 1);
                SetLocalInt(oNewRune, "LOCKED", 1);
                // if all 4 lines are locked - disable the obelisk
                object oMasterRune1 = GetNearestObjectByTag("q5c_MasterRune", oMasterRune, 1);
                object oMasterRune2 = GetNearestObjectByTag("q5c_MasterRune", oMasterRune, 2);
                object oMasterRune3 = GetNearestObjectByTag("q5c_MasterRune", oMasterRune, 3);
                int nLocked1 = GetLocalInt(oMasterRune1, "LOCKED");
                int nLocked2 = GetLocalInt(oMasterRune2, "LOCKED");
                int nLocked3 = GetLocalInt(oMasterRune3, "LOCKED");
                if(nLocked1 && nLocked2 && nLocked3)
                {
                    //object oObelisk = GetObjectByTag("q5c_obelisk");
                    SignalEvent(OBJECT_SELF, EventUserDefined(101));
                    DelayCommand(5.0, AssignCommand(oPC, SpeakOneLinerConversation("q5c_sense_core")));

                }
           }
    }

}
