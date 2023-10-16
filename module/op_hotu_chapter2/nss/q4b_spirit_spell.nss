// Casting a spell on the spirit

void main()
{
    int nSpell = GetLastSpell();
    if(nSpell == SPELL_DISPEL_MAGIC ||
        nSpell == SPELL_GREATER_DISPELLING ||
        nSpell == SPELL_MORDENKAINENS_DISJUNCTION)
        {
            int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_KILL_ONCE");
            if(nDoOnce == 1)
                return;
            SetLocalInt(OBJECT_SELF, "DO_KILL_ONCE", 1);

            SetPlotFlag(OBJECT_SELF, FALSE);
            effect eDeath = EffectDeath();
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eDeath, OBJECT_SELF);
        }
}
