// Setting up the Duergar ambush after player leaves the maker dungeon

#include "x2c2_inc_plot"
#include "nw_i0_generic"
#include "x2_inc_globals"

void JumpDuergar(object oObject)
{
    string sTag = GetTag(oObject) + "_wp_wait";
    object oWP = GetObjectByTag(sTag);
    AssignCommand(oObject, SetSpawnInCondition(NW_FLAG_IMMOBILE_AMBIENT_ANIMATIONS, FALSE));
    AssignCommand(oObject, ClearAllActions());
    AssignCommand(oObject, JumpToObject(oWP));
}

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;

    // light effect near cavallas
    if (GetLocalInt(OBJECT_SELF, "nDoLight") != 1)
    {
        SetLocalInt(OBJECT_SELF, "nDoLight", 1);
        object oStone1 = GetObjectByTag("q4cavallasstone");
        object oStone2 = GetObjectByTag("q4cavallasstone2");
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_GLOW_GREEN), oStone1);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_GLOW_GREEN), oStone2);

    }

    // * TEMP : Restore henchmen from Chapter 2
    //if (GetLocalInt(GetModule(), "temp_spawnhenchmenonce") == 0)
    //{
    //    RestoreAllHenchmen(GetLocation(oPC), oPC);
    //   SetLocalInt(GetModule(), "temp_spawnhenchmenonce", 10);
   // }

    if(GetLocalInt(GetModule(), "q4_power_source_taken") == 1 ||
       GetLocalInt(GetModule(),"Aghaaz")==99 ||
            GetLocalInt(GetModule(),"Ferron")==99 )
    {
        int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_AMBUSH_ONCE");
        if(nDoOnce == 1)
            return;
        SetLocalInt(OBJECT_SELF, "DO_AMBUSH_ONCE", 1);

        object oDahana = GetObjectByTag("q4a_Dahanna");
        JumpDuergar(oDahana);
        AssignCommand(oDahana, ActionDoCommand(bkEquipMelee()));

        object oCleric = GetObjectByTag("q4a_DuergarMerchant");
        JumpDuergar(oCleric);
        AssignCommand(oCleric, ActionDoCommand(bkEquipMelee()));

        int i;
        object oWarrior;
        for(i = 1; i <= 7; i++)
        {
            oWarrior = GetObjectByTag("q4a_DuergarWarrior" + IntToString(i));
            JumpDuergar(oWarrior);
            AssignCommand(oWarrior, bkEquipRanged());
        }
    }
}
