void SitCross(object o)
{
    AssignCommand(o, PlayAnimation(ANIMATION_LOOPING_SIT_CROSS, 1.0, 6.0));

    DelayCommand(6.0, SitCross(o));
}

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        ExploreAreaForPlayer(OBJECT_SELF, oPC);

        if (GetLocalInt(GetModule(), "N_MODULE_STAGE") <= 1)
        {
            object o = GetFirstObjectInArea();

            while (o != OBJECT_INVALID)
            {
                if (GetTag(o) == "CT_UNIQ_EG_INCH")
                    SitCross(o);

                o = GetNextObjectInArea();
            }
        }
    }
}
