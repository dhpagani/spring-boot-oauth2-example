import { Controller } from '@nestjs/common';
import { Crud } from '@nestjsx/crud';
import { Project } from 'src/domain/projects/project.entity';
import { AbstractController } from '../core/abstract.controller';
@Crud({
    model: {
        type: Project,
    },
})
@Controller('projects')
export class ProjectsController extends AbstractController<Project> {}
