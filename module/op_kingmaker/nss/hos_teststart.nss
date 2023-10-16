void HurtPeople (object oPC);

void main()
{
    object oPC = GetFirstPC();
    SetLocalInt(GetModule(), "HOS_TESTSTART", TRUE);
    HurtPeople(oPC);
}

void HurtPeople (object oPC)
{
    object oTarget = GetFirstObjectInShape(SHAPE_SPHERE, 5.0f, GetLocation(oPC));
    effect eDamage = EffectDamage(1);

    if(GetLocalInt(GetModule(), "HOS_TESTSTART")==TRUE)
    {

        while (oTarget != OBJECT_INVALID)
        {
            // Make the PC assign damage to the targets and see who gets angery :)
            if ((oPC != oTarget)
                &&(GetHenchman(oPC, 1) != oTarget)
                &&(GetHenchman(oPC, 2) != oTarget))
            {
                AssignCommand(oPC, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget));
            }

            oTarget = GetNextObjectInShape(SHAPE_SPHERE, 7.0f, GetLocation(oPC));
        }

        DelayCommand(1.0f, HurtPeople(oPC));
    }
}
