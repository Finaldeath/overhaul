void main()
{
if(GetLocalInt(GetModule(),"M2Q2TerariBashDoor") == 1)
    {
    ActionMoveToObject(GetWaypointByTag("WP_M2Q2HTerariBash"),1);
    }
}
