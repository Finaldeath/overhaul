void main()
{
if(GetLocalInt(GetModule(),"M2Q1FarmerHaljalAmbient") == 1)
    {
        SetLocalInt(GetModule(),"M2Q1FarmerHaljalAmbient",2);
        AssignCommand(GetObjectByTag("M2Q1CFarmer"),ActionMoveToObject(GetWaypointByTag("WP_FarmHouse")));
    }
}
