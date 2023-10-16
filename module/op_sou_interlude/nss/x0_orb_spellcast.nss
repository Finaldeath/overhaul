//::///////////////////////////////////////////////
//:: x0_orb_spellcast
//:: Copyright (c) 2003 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Whenever the spellorb has a spell cast on it
    it remembers the spell id.
    Once three spells have been cast on it, it
    destroys iteself and creates the spell staff.

    The variables must be stored on the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Brent
//:: Created On: 2003
//:://////////////////////////////////////////////

void main()
{
    int nTotalSpells = GetLocalInt(OBJECT_SELF, "X0_L_NUMSPELLS");
    int nId = GetLastSpell();
    object oPC = GetLastSpellCaster();

    string sHostile = Get2DAString("spells", "HostileSetting", nId);
    if (sHostile == "1")
    {
        SpeakStringByStrRef(40509);
        return;
    }

    nTotalSpells++;

    SetLocalInt(OBJECT_SELF, "X0_L_SPELL" + IntToString(nTotalSpells), nId);
    SetLocalInt(OBJECT_SELF, "X0_L_NUMSPELLS", nTotalSpells);
    if (nTotalSpells == 3)
    {
        object oItem = CreateItemOnObject("spellstaff", oPC);
        int nSpell1 = GetLocalInt(OBJECT_SELF, "X0_L_SPELL1");
        int nSpell2 = GetLocalInt(OBJECT_SELF, "X0_L_SPELL2");
        int nSpell3 = GetLocalInt(OBJECT_SELF, "X0_L_SPELL3");
        SetCampaignInt("dbItems", "X0_L_spellstaff_SPELL1", nSpell1);
        SetCampaignInt("dbItems", "X0_L_spellstaff_SPELL2", nSpell2);
        SetCampaignInt("dbItems", "X0_L_spellstaff_SPELL3", nSpell3);
        effect eVis = EffectVisualEffect(VFX_IMP_LIGHTNING_M);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC);
        eVis = EffectVisualEffect(VFX_IMP_SPELL_MANTLE_USE);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, OBJECT_SELF);
        object oSound = GetNearestObjectByTag("Q3B_SOUND_SPELLORB");
        DestroyObject(oSound);
        DestroyObject(OBJECT_SELF, 0.5);
        object oPC = GetFirstPC();
        while(oPC != OBJECT_INVALID)
        {
            GiveXPToCreature(oPC, 300);
            oPC = GetNextPC();
        }
    }

}
