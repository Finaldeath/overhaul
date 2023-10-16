////

/////sets plot status to over and marks PC as completing the Uthgardt Plot
void main()
{
    SetLocalInt(GetModule(),"NW_G_M3Q01PLOTUTHGARDTELKTRIBE",99);
    SetLocalObject(OBJECT_SELF,"Uthgardt_Plot",GetPCSpeaker());
}
