//reapply stone effect

void Stone()
{
    SetPlotFlag(OBJECT_SELF, FALSE);
    effect eStone = EffectPetrify();
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eStone, OBJECT_SELF);
    SetPlotFlag(OBJECT_SELF, TRUE);
}

void main()
{
    int nSpell = GetLastSpell();
    if(nSpell == SPELL_DISPEL_MAGIC || nSpell == SPELL_GREATER_DISPELLING || nSpell ==SPELL_MORDENKAINENS_DISJUNCTION)
    {
        //DelayCommand(2.1, Stone());
    }
}
