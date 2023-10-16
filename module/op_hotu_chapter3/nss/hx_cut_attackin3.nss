//::///////////////////////////////////////////////
//:: Name hx_cut_attacking
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will keep scriptless chars fighting
     in the cutscenes.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Sept, 29, 2003
//:://////////////////////////////////////////////
void AttackEnemy();
int GetSpell();

void main()
{
    AttackEnemy();
    DelayCommand(3.0, AttackEnemy());
}

void AttackEnemy()
{
    int iSpell;

    if(GetCurrentAction() != ACTION_CASTSPELL)
    {
         object oEnemy;
        object oEnemy1 = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF, 1);
        object oEnemy2 = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF, 2);
        object oEnemy3 = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF, 3);

        int iRandom = Random(3);

        if(iRandom == 0)
        {
            oEnemy = oEnemy1;
        }
        else if(iRandom == 1)
        {
            oEnemy = oEnemy2;
        }
        else if(iRandom == 2)
        {
            oEnemy = oEnemy3;
        }
        if(Random(100) > 20)
        {
            iSpell = GetSpell();
            ClearAllActions(TRUE);
            ActionCastSpellAtObject(iSpell, oEnemy, METAMAGIC_ANY, TRUE);
        }
        else
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_LOS_EVIL_20), oEnemy);
        }
    }
}

int GetSpell()
{
    int x = Random(8);

    switch(x)
    {
        case 1:
            return SPELL_CALL_LIGHTNING;
            break;
        case 2:
            return SPELL_FIREBRAND;
            break;
        case 3:
            return SPELL_FIREBALL;
            break;
        case 4:
            return SPELL_GREATER_SPELL_BREACH;
            break;
        case 5:
            return SPELL_PHANTASMAL_KILLER;
            break;
        case 6:
            return SPELL_ISAACS_GREATER_MISSILE_STORM;
            break;
        default:
            return SPELL_MAGIC_MISSILE;
            break;
   }
   return SPELL_MAGIC_MISSILE;
}
