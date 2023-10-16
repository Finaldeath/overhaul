//::///////////////////////////////////////////////
//:: Name: q2e_use_evilmach
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
Use the gnomish contraption placeable. When this machine is used,
the first time it will always display a string saying
"The machine seizes and jolts violently, sputtering black smoke out of
several large orifices before it calms once more."
If used again after that, it has a 2-in-3 chance of displaying the
same as the above (but along with a brief poisonous gas cloud),
and a 1-in-3 chance of sending off a random number of fireballs
that each does 10d6 damage.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Jan 16/03
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetLastUsedBy();
    if (GetLocalInt(OBJECT_SELF, "nUses") == 0)
    {
        SetLocalInt(OBJECT_SELF, "nUses", GetLocalInt(OBJECT_SELF, "nUses") + 1);
        FloatingTextStrRefOnCreature(84139 , oPC);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), GetLocation(OBJECT_SELF));

    }
    else
    {
        int nRandom = d6();
        if (nRandom < 5)
        {
            AssignCommand(oPC, PlaySound("as_na_steamlong2"));
            FloatingTextStrRefOnCreature(84140 , oPC);
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectAreaOfEffect(AOE_PER_FOGACID, "nothing", "nothing", "nothing"), GetLocation(oPC));
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_POISON_L), GetLocation(oPC));
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectPoison(POISON_COLOSSAL_SPIDER_VENOM), oPC, 30.0);
        }
        else
        {
            int nFire = d6();
            int nCount;
            AssignCommand(oPC, PlaySound("al_na_lavagyser1"));
            for (nCount = 0; nCount < nFire; nCount++)
            {
                ActionCastSpellAtLocation(SPELL_FIREBALL, GetLocation(GetWaypointByTag("wp_q2efire" + IntToString(nCount))), METAMAGIC_ANY, TRUE);
            }
        }
    }
}
