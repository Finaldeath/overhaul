int StartingConditional()
{
	int l_iResult;
	l_iResult = GetDistanceToObject(GetWaypointByTag("SecretDoor")) < 2.0;
	return l_iResult;
}
