// Place the rod in the slot: release the deva

#include "x2_inc_globals"
#include "nw_i0_plot"
#include "x2c2_inc_plot"

void CreateCrystal(location lLoc)
{
    CreateObject(OBJECT_TYPE_PLACEABLE, "q3c_redsparks", lLoc);
    CreateObject(OBJECT_TYPE_ITEM, "q3_artifact", lLoc);
}

void Talk(object oPC)
{
    BeginConversation("", oPC);
}

void main()
{
        object oPC = GetPCSpeaker();
        Reward_2daXP(oPC, 24);
        int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
        if(nDoOnce == 1)
            return;
        SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);
        object oDeva = GetObjectByTag("q3c_Lavoera");
        SetPlot("q3_deva", 92);
        SetPlot("q2_undead", 50);
        object oRod = GetItemPossessedBy(oPC, "q3c_NullifierRod");
        DestroyObject(oRod);

        AssignCommand(oPC, ClearAllActions());
        SetLocalInt(oDeva, "FREE", 1);
        SetLocalInt(oDeva, "MACHINE_USE", 0);
        effect eEff = GetFirstEffect(oDeva);
        while(GetIsEffectValid(eEff))
        {
            RemoveEffect(oDeva, eEff);
            eEff = GetNextEffect(oDeva);
        }
        effect eVis = EffectVisualEffect(VFX_FNF_LOS_EVIL_10);
        int i;
        location lLoc;
        vector vPos = GetPosition(oDeva);
        float fDelay;
        for(i = 1; i <= 26; i++)
        {
            vPos.z += 0.2;
            lLoc = Location(GetArea(OBJECT_SELF), vPos, 0.0);
            DelayCommand(fDelay, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, lLoc));
            fDelay += 0.08;
        }

        object oMachine = OBJECT_SELF;
        SetPlotFlag(oMachine, FALSE);
        effect eDamage = EffectDamage(1000);
        eVis = EffectVisualEffect(VFX_FNF_FIREBALL);
        effect eLink = EffectLinkEffects(eDamage, eVis);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink, oMachine);
        DelayCommand(0.5, CreateCrystal(GetLocation(oMachine)));
        DelayCommand(1.0, AssignCommand(oDeva, ActionCastSpellAtObject(SPELL_HEAL, OBJECT_SELF, METAMAGIC_ANY, TRUE)));
        SetLocalObject(oDeva, "PC", oPC);
        SignalEvent(oDeva, EventUserDefined(101));
        // Plot: Matron won't have golems from the dracolich now
        SetGlobalInt("x2_plot_undead_out", 1);

}
