-- =============================================
-- TABLE : catalog.PrasadCategories
-- =============================================

CREATE TABLE [catalog].[PrasadCategories]
(
    [CategoryId]        INT IDENTITY(1,1) NOT NULL,
    [ParentCategoryId]  INT NULL,
    [Name]              NVARCHAR(100) NOT NULL,
    [Slug]              VARCHAR(120) NOT NULL,
    [IconUrl]           NVARCHAR(500) NULL,
    [SortOrder]         INT DEFAULT 0,
    [IsActive]          BIT DEFAULT 1,

    CONSTRAINT PK_PrasadCategories
        PRIMARY KEY ([CategoryId]),

    CONSTRAINT UQ_PrasadCategories_Name
        UNIQUE ([Name]),

    CONSTRAINT UQ_PrasadCategories_Slug
        UNIQUE ([Slug]),

    CONSTRAINT FK_PrasadCategories_Parent
        FOREIGN KEY ([ParentCategoryId])
        REFERENCES [catalog].[PrasadCategories]([CategoryId])
);
GO