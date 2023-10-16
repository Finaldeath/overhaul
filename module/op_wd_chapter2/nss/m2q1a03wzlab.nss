//::///////////////////////////////////////////////
//:: Lab Script
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Generic Spell + Reagent magic lab scenario.
     This script contains the functions to setup the lab,
     create items et cetera.
     It can be used in other modules,
     just with its name and the resrefs/tags used changed

*/
//:://////////////////////////////////////////////
//:: Created By: Brent
//:: Created On: November 16, 2001
//:://////////////////////////////////////////////

// * Array Functions

void SetLocalArrayString(object oidObject, string sVarName, int nVarNum, string nValue);
string GetLocalArrayString(object oidObject, string sVarName, int nVarNum);
void SetLocalArrayInt(object oidObject, string sVarName, int nVarNum, int nValue);
int GetLocalArrayInt(object oidObject, string sVarName, int nVarNum);

// * Lab Functions

void CreateLabItem(int nSpellID);


int nNumberOfCombos = 5;

//::///////////////////////////////////////////////
//:: BadResult
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Fill this function in to specify what the bad result
    is when mismatched components and/or spells are used.
*/
//:://////////////////////////////////////////////
//:: Created By:   Brent
//:: Created On:   November 2001
//:://////////////////////////////////////////////

void BadResult()
{
    object oTarget = GetLastSpellCaster();
    int nDamage = d20() * 2;
    effect eVis = EffectVisualEffect(VFX_IMP_FLAME_S);
    effect eFire =  EffectDamage(nDamage,DAMAGE_TYPE_FIRE);

    DelayCommand(0.6, ApplyEffectToObject(DURATION_TYPE_INSTANT, eFire, oTarget));
    DelayCommand(0.6, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget));

}

void SetupLab()
{

  /*

     RULES
     -----

     One spell can only create one kind of item (i.e., a spell cannot be used
     for two combinations)


     THE LOCALS
     -----------
     NW_MYCHESTTAG = The tag of the object where the reagents are put

     THE ARRAYS
     -----------


     NW_COMBO_SPELL = the spell constant
     NW_COMBO_REAGENT_1  = nth positions is the nth combination Reagent #3
     NW_COMBO_REAGENT_2  = nth positions is the nth combination Reagent #2
     NW_COMBO_REWARD = nth position is the nth combination reward

     For example, index 1 of the above would be the first valid combination

  */

    SetLocalString(GetModule(),"NW_MYCHESTTAG","M3Q1LABCHEST");

    /*
      COMBOs
    */

    int nComboNumber = 1;
    // * setup combo one
    // * combo one requires bodak's tooth, glands, and Cure Minor Wounds

    // * setup reagents
    // Bodak's Tooth and Ettercap glands
    for (nComboNumber=1; nComboNumber <= nNumberOfCombos; nComboNumber++)
    {

        switch (nComboNumber)
        {
            // * Ring of Invisibility
            case 1:
                SetLocalArrayInt(GetModule(),"NW_COMBO_SPELL", nComboNumber, SPELL_IMPROVED_INVISIBILITY);
                SetLocalArrayString(GetModule(),"NW_COMBO_REAGENT_1",nComboNumber, "M2Q1ITSKELKNUCKL");
                SetLocalArrayString(GetModule(),"NW_COMBO_REAGENT_2",nComboNumber, "M2Q1ITETTERSILK");

                // * the reward is:
                SetLocalArrayString(GetModule(),"NW_COMBO_REWARD",nComboNumber,"NW_IT_MRING003");
            break;
            // * Amulet of Natural Armor +2
            case 2:
                SetLocalArrayInt(GetModule(),"NW_COMBO_SPELL", nComboNumber, SPELL_MAGE_ARMOR);
                SetLocalArrayString(GetModule(),"NW_COMBO_REAGENT_1",nComboNumber, "M2Q1ITSKELKNUCKL");
                SetLocalArrayString(GetModule(),"NW_COMBO_REAGENT_2",nComboNumber, "M2Q1ITQUARTZCRYS");

                // * the reward is:
                SetLocalArrayString(GetModule(),"NW_COMBO_REWARD",nComboNumber,"NW_IT_MNECK012");
            break;
            // * Armor of the Stars
            case 3:
                SetLocalArrayInt(GetModule(),"NW_COMBO_SPELL", nComboNumber, SPELL_ENDURE_ELEMENTS);
                SetLocalArrayString(GetModule(),"NW_COMBO_REAGENT_1",nComboNumber, "M2Q1ITFIRBEETBEL");
                SetLocalArrayString(GetModule(),"NW_COMBO_REAGENT_2",nComboNumber, "M2Q1ITFENBERRY");

                // * the reward is:
                SetLocalArrayString(GetModule(),"NW_COMBO_REWARD",nComboNumber,"NW_MAARCL003");
            break;
            // * Sash of Shimmering
            case 4:
                SetLocalArrayInt(GetModule(),"NW_COMBO_SPELL", nComboNumber, SPELL_LIGHTNING_BOLT);
                SetLocalArrayString(GetModule(),"NW_COMBO_REAGENT_1",nComboNumber, "M2Q1ITETTERSILK");
                SetLocalArrayString(GetModule(),"NW_COMBO_REAGENT_2",nComboNumber, "M2Q1ITFENBERRY");

                // * the reward is:
                SetLocalArrayString(GetModule(),"NW_COMBO_REWARD",nComboNumber,"NW_IT_MBELT005");
            break;
            // * Wand of Fire
            case 5:
                SetLocalArrayInt(GetModule(),"NW_COMBO_SPELL", nComboNumber, SPELL_FIREBALL);
                SetLocalArrayString(GetModule(),"NW_COMBO_REAGENT_1",nComboNumber, "M2Q1ITFIRBEETBEL");
                SetLocalArrayString(GetModule(),"NW_COMBO_REAGENT_2",nComboNumber, "M2Q1ITQUARTZCRYS");

                // * the reward is:
                SetLocalArrayString(GetModule(),"NW_COMBO_REWARD",nComboNumber,"NW_WMGWN002");
            break;

        }
    }

}

//::///////////////////////////////////////////////
//:: GetSpellPosition
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns the index into the array
     for the matching spellID
     If no match is found, returns -1
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
int GetSpellPosition(int nSpellID)
{
  int i;
  int nMatch = -1;
  for (i = 1; i <= nNumberOfCombos; i++)
  {
    if (GetLocalArrayInt(GetModule(),"NW_COMBO_SPELL", i) == nSpellID)
    {
        nMatch = i;
    }
  }
  return nMatch;
}

//::///////////////////////////////////////////////
//:: GetCombo
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns -1 if an invalid combination otherwise
    returns the index into the array

*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

int GetCombo(int nSpellID)
{
    string sReagent1;
    string sReagent2;

    object oItem =  GetFirstItemInInventory();
    int bValid = GetIsObjectValid(oItem);
    int i = 0;
    int nArrayPosition = -1;
    object oDeleteItem1, oDeleteItem2;

    while (bValid == TRUE)
    {
       i = i + 1;
       if (i == 1)
       {
        sReagent1 = GetTag(oItem);
        oDeleteItem1 = oItem;
       }
       if (i == 2)
       {
        sReagent2 = GetTag(oItem);
        oDeleteItem2 = oItem;
       }
       oItem =  GetNextItemInInventory();
       bValid = GetIsObjectValid(oItem);
       if (i > 2)
         bValid = FALSE;

    }

    // * not enough or too many items
    if ( (i <=0) || (i >= 3) )
    {
        nArrayPosition = -1;
    }
    else
    {
        nArrayPosition = GetSpellPosition(nSpellID);

        if (nArrayPosition != -1)
        {
            string sArrayReagent1 = GetLocalArrayString(GetModule(),"NW_COMBO_REAGENT_1", nArrayPosition);
            string sArrayReagent2 = GetLocalArrayString(GetModule(),"NW_COMBO_REAGENT_2", nArrayPosition);

            // * Do the reagents match the cast spell?
            if ( (sArrayReagent1 == sReagent1 || sArrayReagent1 == sReagent2) &&
                ((sArrayReagent2 == sReagent1 || sArrayReagent2 == sReagent2)))
            {
                // * found a match
               DestroyObject(oDeleteItem1);
               DestroyObject(oDeleteItem2);

               return nArrayPosition;
            }
            else
            {
                nArrayPosition = -1;
            }
        }
    }


    return nArrayPosition;
}

//::///////////////////////////////////////////////
//:: CreateLabItem
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   Called by the OnSpelLCast Event of a container
   and will create the item or cause a bad effect
*/
//:://////////////////////////////////////////////
//:: Created By:    Brent
//:: Created On:    November 2001
//:://////////////////////////////////////////////


void CreateLabItem(int nSpellID)
{
    int nCombo = GetCombo(nSpellID);
    string sItem = GetLocalArrayString(GetModule(),"NW_COMBO_REWARD",nCombo);
    if (sItem == "")
    {
      nCombo = -1;
    }
    // * now make the item or give bad result

    if (nCombo != -1)
    {
        // * delete the reward, it can never be given again
        // * if tried, bad stuff will happen
        SetLocalArrayString(GetModule(),"NW_COMBO_REWARD",nCombo,"");
        CreateItemOnObject(sItem);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_MAGICAL_VISION),GetLastSpellCaster());
    }
    else
    {
        // * something bad happens
        BadResult();
    }
}


/*
 Noel's Array stuff
*/

//::///////////////////////////////////////////////
//:: GetLocalArrayInt
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns an integer, from nVarNum in the array
*/
//:://////////////////////////////////////////////
//:: Created By: Noel
//:: Created On:
//:://////////////////////////////////////////////

    string GetLocalArrayString(object oidObject, string sVarName, int nVarNum)
    {
        string sFullVarName = sVarName + IntToString(nVarNum) ;
        return GetLocalString(oidObject, sFullVarName);
    }

//::///////////////////////////////////////////////
//:: SetLocalArrayInt
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets the integer at nVarNum position
*/
//:://////////////////////////////////////////////
//:: Created By: Noel
//:: Created On:
//:://////////////////////////////////////////////

    void SetLocalArrayString(object oidObject, string sVarName, int nVarNum, string nValue)
    {
        string sFullVarName = sVarName + IntToString(nVarNum) ;
        SetLocalString(oidObject, sFullVarName, nValue);
    }


//::///////////////////////////////////////////////
//:: GetLocalArrayInt
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns an integer, from nVarNum in the array
*/
//:://////////////////////////////////////////////
//:: Created By: Noel
//:: Created On:
//:://////////////////////////////////////////////

    int GetLocalArrayInt(object oidObject, string sVarName, int nVarNum)
    {
        string sFullVarName = sVarName + IntToString(nVarNum) ;
        return GetLocalInt(oidObject, sFullVarName);
    }

//::///////////////////////////////////////////////
//:: SetLocalArrayInt
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets the integer at nVarNum position
*/
//:://////////////////////////////////////////////
//:: Created By: Noel
//:: Created On:
//:://////////////////////////////////////////////

    void SetLocalArrayInt(object oidObject, string sVarName, int nVarNum, int nValue)
    {
        string sFullVarName = sVarName + IntToString(nVarNum) ;
        SetLocalInt(oidObject, sFullVarName, nValue);
    }

