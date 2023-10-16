void main()
{
    object oPC = GetEnteringObject();
    if(GetIsPC(oPC) &&
       GetLocalInt(oPC,"NW_L_M1Q4AWarned") == TRUE &&
       GetLocalInt(OBJECT_SELF,"NW_L_FireOnce") == FALSE)
    {
        SetLocalInt(OBJECT_SELF,"NW_L_FireOnce",TRUE);
        int nNth = 1;
        object oBloodsailor = GetNearestObjectByTag("m1Q04CBloodSail",OBJECT_SELF,nNth);
        while (GetIsObjectValid(oBloodsailor))
        {

            AdjustReputation(oPC,oBloodsailor,-100);
            AssignCommand(oBloodsailor,ActionAttack(oPC));
            nNth++;
            oBloodsailor = GetNearestObjectByTag("m1Q04CBloodSail",OBJECT_SELF,nNth);

        }
    }
}
