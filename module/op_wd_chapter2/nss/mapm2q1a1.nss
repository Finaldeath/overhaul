void main()
{
    object oPlayer = GetEnteringObject();
    if(GetIsPC(oPlayer))
    {
        if(GetLocalInt(OBJECT_SELF,"M2Q2EnteredArea")!=1)
        {
            SetLocalInt(GetModule(),"M2Q1JaxAtMercCamp",1);
            SetLocalInt(GetModule(),"M2Q1JaxLeavesInn",1);
            SetLocalInt(OBJECT_SELF,"M2Q2EnteredArea",1);
        }
    }
}
