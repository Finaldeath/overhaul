// event 101: reveal the pressure-plate puzzle

#include "nw_i0_generic"

// Returns TRUE if the correct plates are pressed down, FALSE otherwise.
int CorrectPlatesSet()
{
    return GetLocalInt(OBJECT_SELF, "XQ2B_PLATE1")  == 1 &&
           GetLocalInt(OBJECT_SELF, "XQ2B_PLATE2")  == 0 &&
           GetLocalInt(OBJECT_SELF, "XQ2B_PLATE3")  == 0 &&
           GetLocalInt(OBJECT_SELF, "XQ2B_PLATE4")  == 1 &&
           GetLocalInt(OBJECT_SELF, "XQ2B_PLATE5")  == 0 &&
           GetLocalInt(OBJECT_SELF, "XQ2B_PLATE6")  == 1 &&
           GetLocalInt(OBJECT_SELF, "XQ2B_PLATE7")  == 1 &&
           GetLocalInt(OBJECT_SELF, "XQ2B_PLATE8")  == 0 &&
           GetLocalInt(OBJECT_SELF, "XQ2B_PLATE9")  == 0 &&
           GetLocalInt(OBJECT_SELF, "XQ2B_PLATE10") == 1 &&
           GetLocalInt(OBJECT_SELF, "XQ2B_PLATE11") == 1 &&
           GetLocalInt(OBJECT_SELF, "XQ2B_PLATE12") == 0 &&
           GetLocalInt(OBJECT_SELF, "XQ2B_PLATE13") == 1 &&
           GetLocalInt(OBJECT_SELF, "XQ2B_PLATE14") == 0 &&
           GetLocalInt(OBJECT_SELF, "XQ2B_PLATE15") == 0 &&
           GetLocalInt(OBJECT_SELF, "XQ2B_PLATE16") == 1;

}

// returns the class that oPC has most levels in
int GetDominantClass(object oPC)
{
    int nMaxClass = 0;
    int nClass1 = GetLevelByPosition(1, oPC);
    int nClass2 = GetLevelByPosition(2, oPC);
    int nClass3 = GetLevelByPosition(3, oPC);
    nMaxClass = nClass1;
    int nMaxClassType;

    if(nClass1 > nClass2)
    {
        nMaxClass = nClass1;
        nMaxClassType = GetClassByPosition(1, oPC);
    }
    else
    {
        nMaxClassType = GetClassByPosition(2, oPC);
        nMaxClass = nClass2;
    }

    if(nClass3 > nMaxClass)
    {
        nMaxClassType = GetClassByPosition(3, oPC);
        nMaxClass = nClass3;
    }

    return nMaxClassType;
}

void main()
{
    int nEvent = GetUserDefinedEventNumber();
    if(nEvent == 101) // Reveal the plates
    {
        SetLocalInt(OBJECT_SELF, "Q2B_PLATES_STATUS", 1); // 1=> puzzle is enabled
        effect eVis = EffectVisualEffect(VFX_IMP_MAGBLUE);
        int n;
        object oPlatePlace;
        for(n = 1; n <= 16; n++)
        {
            oPlatePlace = GetObjectByTag("Q2B_PLATE" + IntToString(n));
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPlatePlace);
            // Creating the pressure plate with the same tag as the invisible object that marks its position
            // and an "X" at the beginningX
            CreateObject(OBJECT_TYPE_PLACEABLE, "q2b_plate", GetLocation(oPlatePlace), FALSE, "X" + GetTag(oPlatePlace));
        }
        // check all creatures and rune placeables in area, and if on a trigger -> trigger the on-enter event
        object oObject = GetFirstObjectInArea(OBJECT_SELF);
        while(oObject != OBJECT_INVALID)
        {
            object oTrigger = GetLocalObject(OBJECT_SELF, "Q2B_ON_PLATE" + ObjectToString(oObject));
            if(oTrigger != OBJECT_INVALID && // is on trigger AND a creature or a placeable runestone
                (GetObjectType(oObject) == OBJECT_TYPE_CREATURE ||
                    (GetObjectType(oObject) == OBJECT_TYPE_PLACEABLE) && GetTag(oObject) == "Q2B_RUNE_PLACE"))
               {
                    SignalEvent(oTrigger, EventUserDefined(101)); // send the missing on-enter event
               }
            oObject = GetNextObjectInArea(OBJECT_SELF);
        }
        object oSac = GetObjectByTag("Q2B_SAC"); // used as focus for GetNearestObjectByTag
        // highlight the flags
        n = 1;
        object oFlag = GetNearestObjectByTag("FreestandingMerchantsPlacard7", oSac, n);
        eVis = EffectVisualEffect(VFX_DUR_PROTECTION_ELEMENTS);
        while(oFlag != OBJECT_INVALID)
        {
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, oFlag);
            n++;
            oFlag = GetNearestObjectByTag("FreestandingMerchantsPlacard7", oSac, n);
        }
    }
    else if(nEvent == 102) // check if puzzle is solved.
    {
        int nStatus = GetLocalInt(OBJECT_SELF, "Q2B_PLATES_STATUS");
        if(CorrectPlatesSet() && nStatus != 2) // if got the right pattern AND did not finish the puzzle yet
        {
            SetLocalInt(OBJECT_SELF, "Q2B_PLATES_STATUS", 2); // 2=> puzzle solved
            object oSac = GetObjectByTag("Q2B_SAC");
            int nClass = GetDominantClass(GetFirstPC());
            if(nClass == CLASS_TYPE_WIZARD ||
               nClass == CLASS_TYPE_SORCERER)
            {
                CreateItemOnObject("q2_alrashid3", oSac);
            }
            else if (nClass == CLASS_TYPE_MONK)
            {
                CreateItemOnObject("q2_alrashid1", oSac);
            }
            else if (nClass == CLASS_TYPE_DRUID)
            {
                CreateItemOnObject("q2_alrashid4", oSac);
            }
            else
            {
                CreateItemOnObject("q2_alrashid2", oSac);
            }
            effect eVis = EffectVisualEffect(VFX_IMP_SUPER_HEROISM);
            effect eRumble = EffectVisualEffect(VFX_FNF_SCREEN_SHAKE);
            effect eLink = EffectLinkEffects(eVis, eRumble);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink, oSac);
            SetLocked(oSac, FALSE);
            DelayCommand(1.0, AssignCommand(oSac, ActionPlayAnimation(ANIMATION_PLACEABLE_OPEN)));
            object oPC = GetFirstPC();
            while(oPC != OBJECT_INVALID)
            {
                GiveXPToCreature(oPC, 200);
                oPC = GetNextPC();
            }
        }
    }
}
