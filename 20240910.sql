DECLARE @getmetadataoutput VARCHAR(MAX)
SET @getmetadataoutput = '[
		{
			"name": "20240908",
			"type": "Folder"
		},
		{
			"name": "20240909",
			"type": "Folder"
		},
		{
			"name": "20240910",
			"type": "Folder"
		},
		{
			"name": "202409911",
			"type": "Folder"
		},
		{
			"name": "input",
			"type": "Folder"
		},
		{
			"name": "output",
			"type": "Folder"
		}
	]'

SELECT FolderName
FROM OPENJSON(@getmetadataoutput)
WITH (FolderName VARCHAR(50) '$.name')
WHERE ISDATE(FolderName) = 1
