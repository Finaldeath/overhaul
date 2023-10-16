#include "NW_I0_Generic"
void main()
{
    int nSpell = GetLastSpell();
    int nOrder = GetLocalInt(OBJECT_SELF,"M1S4GolemCast");
    if ((nOrder == 0 && nSpell == SPELL_STONESKIN) ||
        (nOrder == 1 && nSpell == SPELL_SLOW) ||
        (nOrder == 2 && nSpell == SPELL_COLOR_SPRAY))
    {
        nOrder++;
        SetLocalInt(OBJECT_SELF,"M1S3TestSpellCast",TRUE);
    }
    else if(nOrder == 3 && nSpell == SPELL_BURNING_HANDS)
    {
        SetLocalInt(OBJECT_SELF,"M1S4GolemCast",GetLocalInt(OBJECT_SELF,"M1S4GolemCast") + 1);
        ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectDeath(),OBJECT_SELF);
        SetLocalInt(GetLocalObject(GetArea(OBJECT_SELF),"NW_G_M1S3BTestee"),
                    "NW_L_M1S3Tests",
                    30);
        nOrder++;
    }
    else
    {
        nOrder = 0;
        SetLocalInt(OBJECT_SELF,"M1S3TestSpellCast",FALSE);
        AdjustReputation(GetLastSpellCaster(),OBJECT_SELF,-100);
        DetermineCombatRound();
    }
    SetLocalInt(OBJECT_SELF,"M1S4GolemCast",nOrder);
    SpeakOneLinerConversation();
}
