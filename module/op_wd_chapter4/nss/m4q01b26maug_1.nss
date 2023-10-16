// * Maugrim summons in undead and attacks the player
#include "nw_i0_generic"

void main()
{
    if (GetLocalInt(OBJECT_SELF, "NW_L_GO_HOSTILE") == 0)
    {


/*       object oCreature = CreateObject(OBJECT_TYPE_CREATURE, "m4q1_servant", GetLocation(OBJECT_SELF));
       effect eVis = EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_3);
       DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, oCreature));
       CreateObject(OBJECT_TYPE_CREATURE, "m4q1_servant", GetLocation(OBJECT_SELF));
       DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, oCreature));
  */
       object oCreature = GetNearestObjectByTag("M4Q1B26Servant");
       if (GetIsObjectValid(oCreature)== FALSE)
       {
       // SpeakString("failed");
       }
       ActionCastSpellAtObject(SPELL_TIME_STOP, OBJECT_SELF, METAMAGIC_QUICKEN, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
       ActionCastSpellAtObject(SPELL_RESURRECTION, oCreature, METAMAGIC_QUICKEN, TRUE);
       ActionDoCommand(AssignCommand(oCreature,SetIsDestroyable(TRUE, FALSE, TRUE)));
       ActionDoCommand(AssignCommand(oCreature, DetermineCombatRound()));
       oCreature = GetNearestObjectByTag("M4Q1B26Servant", OBJECT_SELF, 2);
       ActionCastSpellAtObject(SPELL_RESURRECTION, oCreature, METAMAGIC_QUICKEN, TRUE, 0);
       ActionDoCommand(AssignCommand(oCreature,SetIsDestroyable(TRUE, FALSE, TRUE)));
       ActionDoCommand(AssignCommand(oCreature, DetermineCombatRound()));
       ActionCastSpellAtObject(SPELL_PREMONITION, OBJECT_SELF, METAMAGIC_QUICKEN, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
       ActionCastSpellAtObject(SPELL_MASS_HASTE, OBJECT_SELF, METAMAGIC_QUICKEN, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
       ActionDoCommand(SpeakString("NW_I_WAS_ATTACKED", TALKVOLUME_SILENT_TALK));

       object oPC = GetPCSpeaker();
       if (GetIsObjectValid(oPC) == FALSE)
       {
        oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC); //GetLastSpeaker();
       }
       AdjustReputation(oPC, OBJECT_SELF, -100);
       SetLocalInt(OBJECT_SELF, "NW_L_GO_HOSTILE",1);
       ActionDoCommand(SetCommandable(TRUE));
       SetLocalInt(OBJECT_SELF, "NW_L_MYRITUAL", 10);
       SetCommandable(FALSE);
       DetermineCombatRound(oPC);

    }
}
