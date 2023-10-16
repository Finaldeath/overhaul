//act_q5oxen_end
//Have oxen return to their pen when talked to
//(to get them out of the way of the PC on the bridge post-combat
void main()
{
    object oWaypoint = GetWaypointByTag("wp_q5cattle_post");
    ActionForceMoveToObject(oWaypoint, FALSE, 1.0, 30.0);
}
